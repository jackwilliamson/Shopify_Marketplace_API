class ProductsController < ApplicationController

  # GET /products
  def index
    @products = Product.all
    render json: @products, status: :ok
  end

  # POST /products
  def create
    @product = Product.create(product_params)
    render json: @product, status: :created
  end

  def available
    @products = Product.available
    render json: @products, status: :ok
  end


  def product_params
    params.permit(:title, :price, :inventory_count)
  end

  def set_product
    @product = Product.find(params[:title])
  end
end
