class AddCantidadToPedidosDetalle < ActiveRecord::Migration
  def change
    add_column :pedidos_detalle, :cantidad, :integer
  end
end
