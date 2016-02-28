class NotaDeVenta < ActiveRecord::Base
		self.table_name = "nota_de_venta"
		belongs_to :devolucion
end	
