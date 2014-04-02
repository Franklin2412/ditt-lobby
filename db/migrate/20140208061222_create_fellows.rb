class CreateFellows < ActiveRecord::Migration
  def change
    create_table :fellows do |t|
      t.string :name, default: nil
      t.string :email, default: nil
      t.string :encrypted_password, default: nil
      t.string :confirmation_token, default: nil, limit: 25
      t.string :gender, limit: 10, default: nil
      t.string :region
      t.text :about_me
      t.datetime :confirmed_at
      t.timestamps
    end
  end
end
