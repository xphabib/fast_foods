class OrdersController < ApplicationController
  include OrdersHelper

  def index
    @orders = current_employee.orders
  end

  def show
    @order = current_employee.orders.find_by(id: params[:id])
  end

  def update_order_status
    order = current_employee.orders.find_by(id: params[:order_id])
    order.update!(order_status: params[:order_status])
    if params[:index].present?
      redirect_to orders_path
    else
      redirect_to order_show_path(order.id)
    end
  end

  def new
    if session[:cart_id].present?
      @cart = Cart.find_by(id: session[:cart_id])
      unless @cart.present?
        @cart = Cart.create!
        session[:cart_id] = @cart.id
      end
    else
      @cart = Cart.create!
      session[:cart_id] = @cart.id
    end
    @food_menus = FoodMenu.all
    @set_menus = SetMenu.all
  end

  def food_and_set_menu_search
    @cart = Cart.find_by(id: params[:cart_id])
    @food_menus = FoodMenu.where("name LIKE :query", query: "%#{params[:item_name]}%")
    @set_menus = SetMenu.where("name LIKE :query", query: "%#{params[:item_name]}%")
  end

  def edit
    @order = current_employee.orders.find_by(id: params[:id])
    @food_menus = FoodMenu.all
    @set_menus = SetMenu.all
  end

  def order_process
    @order = current_employee.orders.find_by(id: params[:order_id])
  end

  def update
    @order = current_employee.orders.find_by(id: params[:order_id])
    @order.order_status = "Pending"
    @order.total_amount = @order.order_items.sum(:total);
    @order.total_discount = @order.order_items.map{|item| item.discount}.sum
    @order.total_due = @order.total_amount - (params[:order][:paid_amount].to_i + @order.total_discount);
    @order.update(orders_params)
    session[:order_id] = nil
    redirect_to orders_path
  end

  def increase_item
    @cart = Cart.find_by(id: params[:cart_id])
    existing_item = @cart.order_items.find_by(id: params[:food_id]) if params[:food_id].present?
    existing_item.update(total: (existing_item.total+existing_item.orderable.sales_price), qty: existing_item.qty + 1  )
    @items = @cart.order_items
    respond_to do |format|
      format.js {render 'add_to_order_items.js.erb'}
    end
  end

  def decrease_item
    @cart = Cart.find_by(id: params[:cart_id])
    existing_item = @cart.order_items.find_by(id: params[:food_id]) if params[:food_id].present?
    existing_item.update(total: (existing_item.total-existing_item.orderable.sales_price), qty: existing_item.qty - 1  ) if existing_item.qty > 1
    @items = @cart.order_items
    respond_to do |format|
      format.js {render 'add_to_order_items.js.erb'}
    end
  end

  def add_to_order_items
    @cart = Cart.find_by(id: params[:cart_id])
    existing_item = @cart.order_items.find_by(orderable_id: params[:food_menu_id]) if params[:food_menu_id].present?
    existing_item = @cart.order_items.find_by(orderable_id: params[:set_menu_id]) if params[:set_menu_id].present?

    if existing_item.present?
      if params[:food_menu_id].present?
        food_menu = FoodMenu.find_by(id: params[:food_menu_id])
        existing_item.update(qty: existing_item.qty + 1, total: (food_menu.sales_price * (existing_item.qty + 1)))
      elsif params[:set_menu_id].present?
        set_menu = SetMenu.find_by(id: params[:set_menu_id])
        existing_item.update(qty: existing_item.qty + 1, total: (set_menu.sales_price * (existing_item.qty + 1)))
      end
    else
      if params[:food_menu_id].present?
        food_menu = FoodMenu.find_by(id: params[:food_menu_id])
        items = food_menu.order_items.build(cart_id: @cart.id, qty: 1, total: food_menu.sales_price)
        items.discount = food_menu.discount.present?? food_menu.discount.discount_amount : 0
        items.discount_type = food_menu.discount.present?? food_menu.discount.discount_type : ""
        items.save
      elsif params[:set_menu_id].present?
        set_menu = SetMenu.find_by(id: params[:set_menu_id])
        items = set_menu.order_items.build(cart_id: @cart.id, qty: 1, total: set_menu.sales_price  )
        items.discount = set_menu.discount.present?? set_menu.discount.discount_amount : 0
        items.discount_type = set_menu.discount.present?? set_menu.discount.discount_type : ""
        items.save
      end
    end
    @items = @cart.order_items
  end

  def destroy_item
    @cart = Cart.find_by(id: params[:cart_id])
    existing_item = @cart.order_items.find_by(id: params[:food_id]) if params[:food_id].present?
    existing_item.destroy
    @items = @cart.order_items
    respond_to do |format|
      format.js {render 'add_to_order_items.js.erb'}
    end
  end

  def destroy
    order = Order.find(params[:id])
    order.destroy
    redirect_to orders_path
  end

  def pay_now
    @cart = Cart.find_by(id: params[:cart_id])
    @order = current_employee.orders.new
    @payment = Payment.new
    respond_to do |format|
      format.js
    end
  end

  def create_order
    cart = Cart.find(session[:cart_id])
    if cart.order_items.present?
      payment = Payment.new(payment_params)
      payment.employee = current_employee
      payment.total_discount = total_discount(cart.order_items)
      payment.cart_id = session[:cart_id]
      if payment.save
        @order = payment.order
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        flash[:notice] = "Order Complete"

        pdf = render_to_string pdf: "order_receipt", layout: 'pdf', template: "orders/order_summary_pdf.html.erb", encoding: "UTF-8"
        save_path = Rails.root.join('pdfs',"order_receipt_#{@order.id}.pdf")
        File.open(save_path, 'wb') do |file|
          file << pdf
        end
        # system("lpr", "pdfs/order_receipt_#{@order.id}.pdf")

      else
        flash[:denger] = "Something Error"
      end
    else
      flash[:denger] = "Select minimum one items"
    end
    redirect_to new_orders_path
  end

  def create_customer
    Customer.create!(name: params[:name], email: params[:email], phone_no: params[:phone_no], address: params[:address])
  end


  def order_print
    @order = current_employee.orders.find_by(id: params[:id])
    respond_to do |format|
      format.print {render 'orders/order_summary.html.erb', layout: 'print.html.erb'}
    end
  end

  private
  def orders_params
    params.require(:order).permit!
  end

  def payment_params
    params.require(:payment).permit(:last_four_digit, :bank_name, :transaction_no, :pay_type).merge(order_type: params[:order][:order_type], paid_amount: params[:order][:paid_amount], customer_id: params[:order][:customer_id], order_address: params[:order][:order_address], order_table_no: params[:order][:order_table_no]  )
  end

end
