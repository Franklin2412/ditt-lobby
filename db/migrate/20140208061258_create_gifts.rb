class CreateGifts < ActiveRecord::Migration
  def change
    create_table :gifts do |t|
      t.boolean :keyboard, default: false
      t.boolean :guitar, default: false
      t.boolean :tabla, default: false
      t.boolean :singer, default: false
      t.boolean :song_writer, default: false
      t.boolean :drum_set, default: false
      t.boolean :flute, default: false
      t.boolean :trumpet, default: false
      t.boolean :violin, default: false
      t.integer :fellow_id
      t.timestamps
    end
  end
end
