class AddReferencesToPedidosDetalle < ActiveRecord::Migration
  def change
    add_reference :pedidos_detalle, :disfraz, index: true
  end
end
