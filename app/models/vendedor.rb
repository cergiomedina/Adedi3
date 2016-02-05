class Vendedor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
		self.table_name = "vendedor"
		validates_presence_of   :NOMBRE_VENDEDOR
      validates_presence_of   :DIRECCION_VENDEDOR
      validates_presence_of   :RUT_VENDEDOR
      validates_presence_of   :TELEFONO_VENDEDOR
      validates :RUT_VENDEDOR, rut: true
end
