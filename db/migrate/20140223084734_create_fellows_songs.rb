class CreateFellowsSongs < ActiveRecord::Migration
  def change
    create_table :fellows_songs do |t|
      t.integer :fellow_id
      t.integer :song_id
    end
  end
end
