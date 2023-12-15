class OrdersController < ApplicationController
  before_action(:set_all_orders, only: %i[index])
  before_action(:set_order, only: %i[show])
  before_action(:select_products, only: %i[new edit])


  def index

  end


  def show

  end


  def new
    @order = Order.new
  end


  def create

  end


  def edit

  end



  private

  def set_all_orders
    @orders = Order.find_by_sql("
      SELECT orders.id, products.product_name, products.description,
      movements.name_movement,
      orders.quantity, orders.date, orders.address,
      people.name AS person_name, orders.note
      FROM orders
      INNER JOIN products ON orders.product_id = products.id
      INNER JOIN movements ON orders.movement_id = movements.id
      INNER JOIN people ON orders.person_id = people.id
      ")
  end

  def set_order
    order = Order.find(params[:id])

    @order_details = Order.find_by_sql("
      SELECT
      orders.id, orders.quantity, orders.date, orders.address, orders.note,
      products.id, products.product_name, products.description, products.created_at, products.updated_at, purposes.name_purpose,
      movements.name_movement,
      people.name AS person_name, people.job_title, people.personnel_number
      FROM orders
      INNER JOIN products ON orders.product_id = products.id
      INNER JOIN movements ON orders.movement_id = movements.id
      INNER JOIN people ON orders.person_id = people.id
      INNER JOIN purposes ON products.purpose_id = purposes.id
      WHERE orders.id = #{order.id}
      ")[0]
  end



  def select_products
    @select_products = Product.all.each.inject([]) do |result, (t)|
      result << [t.product_name, t.id]
      result
    end
  end

end
