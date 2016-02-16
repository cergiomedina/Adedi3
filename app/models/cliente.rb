class Cliente < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
		self.table_name = "cliente"
      validates_presence_of   :NOMBRE_CLIENTE
      validates_presence_of   :DIRECCION_CLIENTE
      validates_presence_of   :RUT_CLIENTE
      validates_presence_of   :TELEFONO_CLIENTE
      has_many :pedidos
      has_many :arriendos
      has_many :devolucions
      validates :RUT_CLIENTE, rut: true

end
