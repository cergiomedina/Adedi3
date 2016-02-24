class PedidosDetalle < ActiveRecord::Base
		self.table_name = "pedidos_detalle"
		belongs_to :pedido
end
