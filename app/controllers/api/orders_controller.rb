class Api::OrdersController < ApplicationController
  protect_from_forgery with: :null_session
  before_action :set_order, only: [:show, :update, :destroy]

  # GET /orders
  def index
    @orders = Order.all

    render json: @orders
  end

  # GET /orders/1
  def show
    render json: @order
  end

  # POST /orders
  def create

  	# check for params
  	if(!params.has_key?(:eans))
  		render json: {"error" => "Post must include list of ean's"}, status: :unprocessable_entity
  		return
  	end

  	# create product list from EAN's
  	products = []
  	params[:eans].each do |ean|
  		product = Product.where(ean: ean).first
  		if product 
  			products.push(product)
  		end
    end

    # if there were no found products don't create the order
    if(products.count == 0) 
    	render json: {"error" => "no products were found with the given list of ean's"}, status: :unprocessable_entity
    	return
    end

   	# check for successful creation
    @order = Order.new(order_params)
    if !@order.save
    	render json: @order.errors, status: :unprocessable_entity 
    	return 
    end

    # add the products to the order and return
    products.each do |product| 
    	@order.products << product
    end
    render json: {"order" => @order, "products" => @order.products}, status: :created, location: @order
  
  end

  # PATCH/PUT /orders/1
  def update
    if @order.update(order_params)
      render json: @order
    else
      render json: @order.errors, status: :unprocessable_entity
    end
  end

  # DELETE /orders/1
  def destroy
    @order.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order
      @order = Order.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def order_params
      params.require(:order).permit(:user_id, :shop_id, :eans)
    end
end