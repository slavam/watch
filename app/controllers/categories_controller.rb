class CategoriesController < ApplicationController
  before_filter :find_category, :only => [:show, :destroy]
  before_filter :find_categories, :only => [:index, :show_catalog]
  def index
  end
  
  def show
  end

  def show_catalog
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

  def find_categories
    @categories = Category.order(:name)
  end
end
