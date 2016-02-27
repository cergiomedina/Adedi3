class AddDescripcionPrecioToDisfraz < ActiveRecord::Migration
  def change
    add_column :disfraz, :descripcion, :string
    add_column :disfraz, :precio, :integer
  end
end
