class ProductsController < ApplicationController
  before_action(:set_product, only: %i[edit update show destroy])
  before_action(:select_purposes, only: %i[new edit])

  def index
    #@products_all = Product.joins("INNER JOIN purposes ON products.purpose_id = purposes.id ")
    @products_all = Product.find_by_sql(
      "SELECT products.id, products.product_name, products.description, purposes.name_purpose,
      products.updated_at, products.created_at
      FROM products
      INNER JOIN purposes ON products.purpose_id = purposes.id;
      ")
  end

  def show
    @product = Product.find_by_sql(
      "SELECT products.id, products.product_name, products.description, purposes.name_purpose,
      products.updated_at, products.created_at
      FROM products
      INNER JOIN purposes ON products.purpose_id = purposes.id
      WHERE products.id = #{params[:id]};
      ")
  end

  def new
    @product = Product.new
  end

  def create
    product = Product.new(product_params)
    product.save

    redirect_to('/products')
  end

  def edit

  end

  def update
    #debugger
    @product.update(product_params)

    redirect_to("/products/#{@product.id}")
  end

  def destroy
    @product.destroy

    redirect_to("/products")
  end


  private

  def product_params
    params.require(:product).permit(:product_name, :description, :purpose_id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def select_purposes
    @select_purposes = Purpose.all.each.inject([]) do |result, (t)|
      result << [t.name_purpose, t.id]
      result
    end
  end

end
