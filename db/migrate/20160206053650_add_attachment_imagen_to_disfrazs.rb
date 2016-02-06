class AddAttachmentImagenToDisfrazs < ActiveRecord::Migration
  def self.up
    change_table :disfraz do |t|
      t.attachment :imagen
    end
  end

  def self.down
    remove_attachment :disfraz, :imagen
  end
end
