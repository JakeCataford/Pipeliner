class AddAttachmentFileToTextures < ActiveRecord::Migration
  def self.up
    change_table :textures do |t|
      t.attachment :file
    end
  end

  def self.down
    drop_attached_file :textures, :file
  end
end
