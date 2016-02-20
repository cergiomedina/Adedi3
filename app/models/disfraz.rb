class Disfraz < ActiveRecord::Base
	self.table_name = "disfraz"

	has_attached_file :imagen, styles: { medium: "300x300>", thumb: "100x100>" , big: "500x500>"}, default_url: "default.png"
  	validates_attachment_content_type :imagen, content_type: /\Aimage\/.*\Z/
	belongs_to :categoria, class_name: "categoria"
	validates_attachment_size :imagen, :less_than => 5.megabytes
	
	
	def self.search(term)
	   where("CATEGORIA_DISFRAZ like :term", term: "#{term}")
	 end

end
