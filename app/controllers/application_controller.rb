class ApplicationController < ActionController::Base

  def update_order_product(order, order_params)
    quantity_order_old = order.quantity.to_i # 11
    quantity_product = order.product.quantity.to_i #-1
    quantity_order_new = order_params[:quantity].to_i # 15

    if order_params[:movement_id] == '2' # расход
      if quantity_order_new < quantity_order_old
        tmp = quantity_order_old - quantity_order_new
        new_quantity = quantity_product + tmp
        return(new_quantity)
      else quantity_order_new > quantity_order_old
        tmp = quantity_order_new - quantity_order_old
        new_quantity = quantity_product - tmp
        return(new_quantity)
      end
    end

    if order_params[:movement_id] == '1'
      if quantity_order_new < quantity_order_old
        tmp = quantity_order_old - quantity_order_new
        new_quantity = quantity_product - tmp
        return(new_quantity)
      else quantity_order_new > quantity_order_old
        tmp = quantity_order_new - quantity_order_old
        new_quantity = quantity_product + tmp
        return(new_quantity)
      end
    end
  end
end
