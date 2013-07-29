class AddFileToMesh < ActiveRecord::Migration
  def self.up
    add_attachment :meshes, :file
  end

  def self.down
    remove_attachment :meshes, :file
  end
end
