class MenuCategoriesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    @menu_categories = MenuCategory.all
  end

  def create
    category_name = params[:category_name]
    new_category = MenuCategory.new(
      name: category_name,
    )
    if new_category.save
      render plain: "new category has created!"
    end
  end

  def update
    id = params[:id]
    category_name = params[:category_name]
    category = MenuCategory.find(id)
    category.name = category_name
    category.save!
    render plain: "category name has been updated."
  end
end
