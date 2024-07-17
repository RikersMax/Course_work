class StoragesController < ApplicationController
  before_action(:require_authentcation)

  def index
    role_check([1, 2, 3, 4, 5])
    @products = Product.order(id: :desc)
  end

  def edit
    role_check([2, 3, 4, 5])
    @product = Product.find(params[:id])
  end

  def update
    role_check([2, 3, 4, 5])
    permit_params = params.require(:product).permit(:quantity)
    @product = Product.find(params[:id])

    if @product.update(permit_params)
      flash[:notice] = "#{@product.name} - количество изменено"
      redirect_to(storages_path)
    else
      flash.now[:danger] = @product.errors.full_messages
      render(:edit)
    end
  end



end
