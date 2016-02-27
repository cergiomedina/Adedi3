class Cart
	attr_reader :items
	attr_reader :total_price

	def initialize
		@items = []
		@total_price = 0.0
	end

	def add_disfraz(product)
		@items << LineItem.for_disfraz(disfraz)
		@total_price += disfraz.precio
	end
end