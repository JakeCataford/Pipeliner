class AddAttachmentDiffuseToMeshes < ActiveRecord::Migration
  def self.up
    change_table :meshes do |t|
      t.attachment :diffuse
    end
  end

  def self.down
    drop_attached_file :meshes, :diffuse
  end
end
