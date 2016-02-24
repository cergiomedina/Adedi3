class Pedido < ActiveRecord::Base
		self.table_name = "pedido"
		 belongs_to :cliente
		 has_many :pedidos_detalles
		 validates_date :FECHA_PEDIDO, :after => lambda { Date.current + 3 },
		 								:after_message => "no puede ser una fecha pasada. y debe ser a 3 días futuros como mínimo"
		 validates_presence_of   :ID_EST_PEDIDO, :message => "El pedido debe tener un estado"
		 validates_presence_of   :FECHA_PEDIDO, :message => "El pedido debe tener una fecha de creación"
		 validates_presence_of   :cliente_id, :message => "El pedido debe estar asociado a un cliente"
		 validates_presence_of   :ESTADO_PEDIDO, :message => "El pedido debe tener un estado"
		  
end
