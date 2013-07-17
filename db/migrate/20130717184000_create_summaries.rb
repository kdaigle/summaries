class CreateSummaries < ActiveRecord::Migration
  def change
    create_table :summaries do |t|
      t.integer :user_id
      t.boolean :public, :default => false
      t.text :content
      t.text :markdown_content
      t.string :url
      t.timestamps
    end

    add_index :summaries, :user_id
  end
end
