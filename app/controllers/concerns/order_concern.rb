module OrderConcern
  extend ActiveSupport::Concern

  private

  def update_order_product(order, order_params)
    quantity_order_old = order.quantity.to_i
    quantity_product = order.product.quantity.to_i
    quantity_order_new = order_params[:quantity].to_i

    case order_params[:movement_id]
    when '2'
      if quantity_order_new < quantity_order_old
        tmp = quantity_order_old - quantity_order_new
        quantity_product + tmp

      else
        tmp = quantity_order_new - quantity_order_old
        quantity_product - tmp

      end
    when '1'
      if quantity_order_new < quantity_order_old
        tmp = quantity_order_old - quantity_order_new
        quantity_product - tmp

      else
        tmp = quantity_order_new - quantity_order_old
        quantity_product + tmp

      end
    end
  end

  def update_product_delete_order(order)
    product = order.product

    case order.movement_id.to_s
    when '1'
      quantity_new = product.quantity.to_i - order.quantity.to_i
      product.update(quantity: quantity_new)
    when '2'
      quantity_new = product.quantity.to_i + order.quantity.to_i
      product.update(quantity: quantity_new)
    end
  end
end
