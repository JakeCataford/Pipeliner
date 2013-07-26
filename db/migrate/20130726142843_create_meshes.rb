class CreateMeshes < ActiveRecord::Migration
  def change
    create_table :meshes do |t|
      t.string :name
      t.string :format

      t.timestamps
    end
  end
end
