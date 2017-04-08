class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.integer :author_id, null: false
      t.string :title, null: false
      t.text :text, null: false
      t.boolean :published?, default: false

      t.timestamps
    end
  end
end
