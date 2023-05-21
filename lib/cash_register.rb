class CashRegister
    attr_reader :total, :discount, :items
  
    def initialize(discount = 0)
      @total = 0
      @discount = discount
      @items = []
    end
  
    def total=(value)
      @total = value
    end
  
    def add_item(title, price, quantity = 1)
      item_cost = price * quantity
      self.total += item_cost
      quantity.times { @items << title }
    end
  
    def apply_discount
      if discount > 0
        discount_amount = (total * discount) / 100
        self.total -= discount_amount
        "After the discount, the total comes to $#{total}."
      else
        "There is no discount to apply."
      end
    end
  
    def void_last_transaction
        last_item = @items.pop
        last_item_quantity = @items.count(last_item) + 1
        last_item_price = item_price(last_item) * last_item_quantity
        self.total -= last_item_price
        self.total = 0.0 if @items.empty?
      end
      
      
    def item_price(item)
      case item
      when "eggs"
        1.99
      when "tomato"
        1.76
      else
        0
      end
    end
  end
  