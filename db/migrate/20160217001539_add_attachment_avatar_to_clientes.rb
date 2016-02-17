class AddAttachmentAvatarToClientes < ActiveRecord::Migration
  def self.up
    change_table :cliente do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :cliente , :avatar
  end
end
