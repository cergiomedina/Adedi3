class ParametroSistema < ActiveRecord::Base
		self.table_name = "parametro_sistema"
		validates_presence_of   :NOMBRE_PARAMETRO, :message => "El parámetro debe tener un nombre."
		validates_presence_of   :TIPO_PARAMETRO, :message => "El parámetro debe tener tipo asociado."
		validates_presence_of   :VALOR_PARAMETRO, :message => "El parámetro debe tener un valor."
		validates_presence_of   :DESCRIPCION_PARAMETRO, :message => "El parámetro debe tener una descripción."
end
