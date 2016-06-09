class CashRegister
  attr_accessor :discount, :total, :items

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @items = []
    @last_transaction = 0
  end

  def add_item(title, price, quantity=1)
    @total += price*quantity
    for i in 1..quantity
      @items << title
    end
    @last_transaction = price
  end

  def apply_discount
    if discount == 0
      "There is no discount to apply."
    else
      @total *= (100.0-discount)/100
      "After the discount, the total comes to $#{total.to_i}."
    end
  end

  def items
    @items
  end

  def void_last_transaction
    @total -= @last_transaction
  end
end
