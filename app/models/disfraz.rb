class Disfraz < ActiveRecord::Base
		self.table_name = "disfraz"
		belongs_to :categoria
end
