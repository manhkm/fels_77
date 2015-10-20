class CategoriesController < ApplicationController
  def index
    @categories = Category.paginate page: params[:page]
  end

  def show
    @category = Category.find params[:id]
    @words = @category.words.paginate page: params[:page]
    @learwords = Word.learn_category(current_user,@category)
  end

  def new
    @category = Category.new
  end
end
