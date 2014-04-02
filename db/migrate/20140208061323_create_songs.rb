class CreateSongs < ActiveRecord::Migration
  def change
    create_table :songs do |t|
      t.string :title, default: nil, limit: 30
      t.string :reference
      t.string :type
      t.string :language
      t.text :lyrics, default: nil
      t.integer :keyboard
      t.integer :guitar
      t.integer :tabla
      t.integer :singer
      t.integer :song_writer
      t.integer :drum_set
      t.integer :flute
      t.integer :trumpet
      t.integer :violin
      t.timestamps
    end
  end
end
