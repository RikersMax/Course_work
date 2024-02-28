class ProductsController < ApplicationController
  before_action(:require_authentcation)
  before_action(:product_find, only: %i[edit show destroy update])
  before_action(:target_select, only: %i[edit show new update create])

  def index
    @products = Product.order(id: :desc)
  end

  def show; end

  def new
    @product = Product.new
  end

  def edit; end

  def create
    product_data = product_params
    product_data[:quantity] = '0'
    @product = Product.new(product_data)

    if @product.save
      flash[:notice] = 'Изделие успешно создано'
      redirect_to(products_path)
    else
      flash.now[:danger] = 'Ошибка ввода'
      render(:new)
    end
  end

  def update
    if @product.update(product_params)
      flash[:notice] = 'Изделие изменено'
      redirect_to(products_path)
    else
      flash.now[:danger] = 'Ошибка ввода'
      render(:edit)
    end
    # render(plain: params.to_yaml)
  end

  def destroy
    flash[:info] = "#{@product.name} удалено"
    @product.destroy
    redirect_to(products_path)

    # render(plain: params.to_yaml)
  end

  private

  def target_select
    @targets = Target.all.map { |t| [t.name, t.id] }
  end

  def product_find
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :ident_number, :target_id, :description)
  end
end
