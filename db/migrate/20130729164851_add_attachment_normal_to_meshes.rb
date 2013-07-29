class AddAttachmentNormalToMeshes < ActiveRecord::Migration
  def self.up
    change_table :meshes do |t|
      t.attachment :normal
    end
  end

  def self.down
    drop_attached_file :meshes, :normal
  end
end
