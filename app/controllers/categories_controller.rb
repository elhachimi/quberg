class CategoriesController < ApplicationController
  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def create
    category = Category.new category_params

    if category.save
      flash[:success] = "Category saved successfully"
      redirect_to categories_path
    else
      flash[:danger] = "Title is modatory"
      redirect_to :back
    end
  end
  
  private

  def category_params
    params.require(:category).permit(:title, :description)
  end
end