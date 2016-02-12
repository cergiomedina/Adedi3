class Categoria < ActiveRecord::Base
		self.table_name = "categoria"
		validates_presence_of   :NOMBRE_CATEGORIA
      	validates_presence_of   :STOCK_CATEGORIA
		has_many :disfrazs, :dependent => :nullify, class_name: "disfraz", foreign_key: "ID_CATEGORIA"
end
