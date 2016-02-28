class Arriendo < ActiveRecord::Base
		self.table_name = "arriendo"
		has_many :devolucion

end
