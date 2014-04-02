class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :song_id
      t.integer :fellow_id
      t.timestamps
    end
  end
end
