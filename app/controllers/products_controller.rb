class ProductsController < ApplicationController
  before_action(:product_find, only: %i[edit show destroy update])
  before_action(:target_select, only: %i[edit show new update])

  def index
    @products = Product.order(id: :desc)
  end

  def show

  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save then
      flash[:notice] = 'Изделие успешно созданно'
      redirect_to(products_path)
    else
      flash.now[:danger] = 'Ошибка ввода'
      render(:new)
    end
  end

  def edit

  end

  def update
    if @product.update(product_params)  then
      redirect_to(products_path)
    else
      flash.now[:danger] = 'test'
      render(:edit)
    end
    #render(plain: params.to_yaml)
  end

  def destroy
    flash[:info] = "#{@product.name} удален"
    @product.destroy
    redirect_to(root_path)

    #render(plain: params.to_yaml)
  end


  private

  def target_select
    @targets = Target.all.map{|t| [t.name, t.id]}
  end

  def product_find
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :ident_number, :target_id, :description)
  end

end
