module OrdersHelper
  def food_discount(food_id)
    food = FoodMenu.find_by(id: food_id)
    product_discount = "0%"
    if food.discount.present?
      discount = food.discount
      case discount.discount_type
        when Discount::DISCOUNT_TYPE[0]
          product_discount = "#{discount.discount_amount} taka"
        when Discount::DISCOUNT_TYPE[1]
          product_discount = "#{discount.discount_amount} %"
      end
    end
    product_discount
  end

  def set_discount(set_id)
    food = SetMenu.find_by(id: set_id)
    product_discount = "0%"
    if food.discount.present?
      discount = food.discount
      case discount.discount_type
        when Discount::DISCOUNT_TYPE[0]
          product_discount = "#{discount.discount_amount} taka"

        when Discount::DISCOUNT_TYPE[1]
          product_discount = "#{discount.discount_amount} %"
      end
    end
    product_discount
  end

  def total_discount(items)
    total_discount_amount = 0;

    items.each do |item|
      total_discount_amount = total_discount_amount + item_discount_amount(item)
    end
    total_discount_amount
  end

  def item_discount_amount(item)
    item_discount = 0
    if item.discount.present? && item.discount_type == Discount::DISCOUNT_TYPE[0]
      item_discount = item_discount + item.discount * item.qty
    end
    if item.discount.present? && item.discount_type == Discount::DISCOUNT_TYPE[1]
      item_discount = item_discount + (item.discount * item.total)/100
    end
    item_discount
  end

  def order_type(order)
    destination = ""
    if order.present?
      case order.order_type
        when Order::ORDER_TYPE[0]
          destination = "Table No:"
        when Order::ORDER_TYPE[1]
          destination = "Parcel Address:"
        when Order::ORDER_TYPE[2]
          destination = "Home Address:"
      end
    end
    destination
  end

end
