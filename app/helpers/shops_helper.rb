module ShopsHelper

  def get_rep_name_link(shop)
    if shop.reps.count != 0
      link_to shop.reps.first.first_name + ' ' + shop.reps.first.last_name, shop.reps.first
    else
      'No rep specified'
    end
  end

end
