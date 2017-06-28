class CashRegister
	attr_accessor :total

	def initialize(discount = 0)
		@total = 0
		@discount = discount
		@items = []
		@prices = []
	end

	def add_item(name, price, quantity = 1)
		@total += price * quantity
		@prices.push(price * quantity)
		(1..quantity).each do
			@items.push(name)
		end
	end

	def apply_discount
		msg = ""
		if discount > 0
			@total -= @total * @discount / 100
			msg = "After the discount, the total comes to $#{@total}."
		else
			msg = "There is no discount to apply."
		end
		msg
	end

	def discount
		@discount
	end

	def items
		@items
	end

	def void_last_transaction
		@items.pop
		last_amount = @prices.pop
		@total -= last_amount
	end
end
