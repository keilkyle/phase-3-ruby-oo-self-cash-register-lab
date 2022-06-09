class CashRegister

    attr_accessor :discount, :total, :items, :prices

    def initialize(discount = 0)
        self.items = []
        self.prices = []
        self.total = 0
        self.discount = discount
    end

    def add_item(title, price, quantity = 1)
        @total += (price * quantity)
        self.prices.push(price*quantity)
        self.items.fill(title, self.items.size, quantity)
    end

    def apply_discount
        if self.discount > 0
            percentDiscount = (1 - (self.discount.to_f / 100))
            self.total = percentDiscount * self.total
            "After the discount, the total comes to $#{self.total.to_i}."
        else 
            "There is no discount to apply."
        end
    end

    def void_last_transaction
        self.prices.pop
        @total = self.prices.sum
    end    


end
