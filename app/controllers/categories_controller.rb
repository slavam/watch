class CategoriesController < ApplicationController
  before_filter :find_category, :only => [:show, :destroy]
  def index
    @categories = Category.order(:name)
  end
  
  def show
  end
  
  def new
    @category = Category.new
  end

  def create
    @category = Category.new params[:category]

    if not @category.save
      render :new
    else
#      notice_created
      redirect_to :categories
    end
  end

  def destroy
    @category.destroy
    redirect_to :categories
  end

  private
  
  def find_category
    @category = Category.find params[:id]
  end
  
end
