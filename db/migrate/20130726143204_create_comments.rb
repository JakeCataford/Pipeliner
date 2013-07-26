class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.integer :user_id
      t.string :message
      t.integer :revision_id

      t.timestamps
    end
  end
end
