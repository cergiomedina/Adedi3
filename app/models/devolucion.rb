class Devolucion < ActiveRecord::Base
		self.table_name = "devolucion"
		belongs_to :arriendo
		has_one :nota_de_venta
end
