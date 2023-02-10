require 'pry'
class CashRegister
    attr_reader :items
    attr_accessor :discount, :total, :items, :last_transaction
    

    def initialize discount=0
        @discount = discount
        @total = 0
        @items = []
    end

    def add_item title, price, quantity=1
        self.total += price*quantity
        quantity.times{|i| self.items << title}
        self.last_transaction = price*quantity
    end

    def apply_discount
        # binding.pry
        if discount == 0
            return "There is no discount to apply."
        end
        self.total = total * (1-(discount/100.0))
        "After the discount, the total comes to $#{total.to_int}."
    end

    def void_last_transaction
        self.total-=last_transaction
    end


end