class ProductsController < ApplicationController

  before_action :set_product, only: [:show]

  # GET /products
  def index
    if params[:title].present?
      @products = Product.find_by_title(params[:title])
    else
      @products = Product.all
    end
    render json: @products, status: :ok
  end

  # POST /products
  def create
    @product = Product.create(product_params)
    render json: @product, status: :created
  end

  def show
    render json: @product, status: :ok
  end

  def available
    @products = Product.available
    render json: @products, status: :ok
  end

  def purchase
    @response = Product.sell_inventory(params[:id])
    render json: @response, status: :ok
  end

  def product_params
    params.permit(:title, :price, :inventory_count)
  end

  def set_product
    @product = Product.find(params[:id])
  end
end
