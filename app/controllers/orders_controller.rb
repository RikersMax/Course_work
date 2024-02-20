class OrdersController < ApplicationController
  before_action(:require_authentcation)
  before_action(:order_find, only: %i[edit update destroy])
  before_action(:product_select, only: %i[
    arrival_of_goods
    consumption_of_goods
    create_arrival_of_goods
    create_consumption_of_goods
    edit
    update])

  before_action(:employee_select, only: %i[
    arrival_of_goods
    consumption_of_goods
    create_arrival_of_goods
    create_consumption_of_goods
    edit
    update])

  def index
    @orders = Order.order(id: :desc)
  end

  def arrival_of_goods #приход
    @hidden_field = '1'

    @orders = product_movement_id(1)
    @order = Order.new

  end

  def consumption_of_goods #расод
    @hidden_field = '2'

    @orders = product_movement_id(2)
    @order = Order.new
  end


  def create_arrival_of_goods #приход
    @order = Order.new(order_params)
    #render(plain: params[:order])

    if @order.save then
      quantity_order = @order.product.quantity + @order.quantity
      product = Product.find(@order.product_id)
      product.update(quantity: quantity_order)


      flash[:notice] = "#{@order.product.name} отправленно на склад"
      redirect_to('/arrival_of_goods')
    else
      @orders = product_movement_id(1)
      flash.now[:danger] = @order.errors.full_messages
      render(:arrival_of_goods)
    end
  end


  def create_consumption_of_goods #расод
    @order = Order.new(order_params)
    #render(plain: params[:order])

    if @order.save then
      quantity_order = @order.product.quantity - @order.quantity
      product = Product.find(@order.product_id)
      product.update(quantity: quantity_order)

      flash[:notice] = "#{@order.product.name} отправленно на #{@order.address}"
      redirect_to('/consumption_of_goods')
    else
      @orders = product_movement_id(2)
      flash.now[:danger] = @order.errors.full_messages
      render(:consumption_of_goods)
    end
  end

  def edit
    @hidden_field = @order.movement_id.to_s
  end

  def update
    new_quantity = update_order_product(@order, order_params)

    if @order.update(order_params) then
      product = Product.find(@order.product_id)
      product.update(quantity: new_quantity)
      flash[:notice] = 'Запись изменена'
      redirect_to(orders_path)
    else
      flash.now[:danger] = @order.errors.full_messages
      render(:edit)
    end
  end

  def destroy
    flash[:info] = 'Запись удалена'
    @order.destroy
    redirect_to(orders_path)
  end


  private

  def order_find
    @order = Order.find(params[:id])
  end

  def product_select
    @products = Product.all.map{|p| [p.name, p.id]}
  end

  def employee_select
    @employee = Employee.all.map{|e| [e.name, e.id]}
  end

  def order_params
    params.require(:order).permit(:product_id, :quantity, :employee_id, :address, :description, :datestamp, :movement_id)
  end

  def product_movement_id(id_movement)
    Order.where(created_at: (Time.now.midnight-1.day..Time.now.end_of_day)).and(Order.where(movement_id: id_movement)).order(id: :desc)
  end


end
