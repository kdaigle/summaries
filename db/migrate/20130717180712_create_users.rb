class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :token
      t.string :secret
      t.string :nickname
      t.string :name
      t.timestamps
    end
    add_index :users, :uid, :unique => true
  end
end
