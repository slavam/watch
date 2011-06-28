class ProductsController < ApplicationController
  before_filter :find_category
  before_filter :find_product, :only => [:show, :destroy]
  def index
    @products = @category.products.order(:name)
  end
  
  def show
  end
  
  def new
    @product = @category.products.build
  end

  def create
    @product = @category.products.create params[:product]

    if not @product.save
      render :new
    else
#      notice_created
      redirect_to category_products_path(@category)
    end
  end

  def destroy
    @product.destroy
    redirect_to category_products_path(@category)
  end

  private
  
  def find_category
    @category = Category.find params[:category_id]
  end
  
  def find_product
    @product = @category.products.find params[:id]
  end
end
