class CreateRevisions < ActiveRecord::Migration
  def change
    create_table :revisions do |t|
      t.integer :number
      t.integer :model_id
      t.integer :mesh_id
      t.integer :diffuse
      t.integer :normalmap
      t.integer :specular

      t.timestamps
    end
  end
end
