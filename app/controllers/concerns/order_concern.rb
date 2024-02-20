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
          new_quantity = quantity_product + tmp
          return(new_quantity)
        else quantity_order_new > quantity_order_old
          tmp = quantity_order_new - quantity_order_old
          new_quantity = quantity_product - tmp
          return(new_quantity)
        end
      when '1'
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
