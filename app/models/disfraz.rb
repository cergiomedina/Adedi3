class Disfraz < ActiveRecord::Base
	self.table_name = "disfraz"

		has_attached_file :imagen, styles: { medium: "300x300>", thumb: "100x100>" , big: "500x500>"}, default_url: "/images/default.png"
  validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\Z/
		belongs_to :categoria, class_name: "categoria"
		validates_attachment_presence :imagen, :message => "El disfraz debe tener una imagen representativa."
	validates_attachment_size :imagen, :less_than => 5.megabytes
	
	validates_presence_of   :CATEGORIA_DISFRAZ, :message => "El disfraz debe poseer un nombre"
    validates_presence_of   :STOCK_DISFRAZ, :message => "El disfraz debe tener al menos 1 prenda disponible"
    validates_presence_of   :ID_CATEGORIA, :message => "El disfraz debe pertenecer a una categoría"

	def self.search(term)
	   where("CATEGORIA_DISFRAZ like :term", term: "#{term}")
	 end

end
