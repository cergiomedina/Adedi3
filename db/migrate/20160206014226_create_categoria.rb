class CreateCategoria < ActiveRecord::Migration
  def change
    create_table :categoria do |t|
      t.string :NOMBRE_CATEGORIA
      t.integer :STOCK_CATEGORIA
      t.primary_key :ID_CATEGORIA

      t.timestamps
    end
  end
end
