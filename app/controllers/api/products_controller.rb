class Api::ProductsController < ApplicationController
	protect_from_forgery with: :null_session
  before_action :set_product, only: [:show, :update, :destroy]

  # GET /products
  def index
    @products = Product.all

    render json: @products
  end

  # GET /products/1
  def show
    render json: @product
  end

  # POST /products
  def create
    @product = Product.new(product_params)

    if @product.save
      render json: @product, status: :created, location: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /products/1
  def update
    if @product.update(product_params)
      render json: @product
    else
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  # DELETE /products/1
  def destroy
    @product.destroy
  end

  # GET /products/ean/12345
  def getProductFromEAN 

  	# check for params
  	if(!params.has_key?(:ean))
  		render json: {"error" => "ean is required"}, status: :unprocessable_entity
  		return
  	end

  	# find product and return if it exists
  	product = Product.where(ean: params[:ean]).first
  	if product
  		render json: product
  	else
  		render json: {"error" => "Product with that ean was not found"}, status: :not_found
  	end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def product_params
      params.require(:product).permit(:name, :ean, :available_in_app, :points, :brand_id)
    end
end
