class ProductsController < ApplicationController

  def index
    @products = Product.all
  end

  def new
    @targets = Target.all.map{|t| [t.name, t.id]}
    @product = Product.new
  end

  def create
    @product = Product.new(set_params)

    if @product.valid? then
      @product.save
      redirect_to(products_path)
    else
      @targets = Target.all.map{|t| [t.name, t.id]}
      render(:new)
    end
  end

  def edit

  end

  def update

  end


  private

  def set_params
    params.require(:product).permit(:name, :ident_number, :target_id, :description)
  end

end
