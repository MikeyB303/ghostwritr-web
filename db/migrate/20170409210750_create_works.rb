class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :previous_term, null: false
      t.string :next_word, null: false
      t.float :probability, null: false
      t.integer :author_id, null: false
      t.integer :n_size, null:false
    end
    
      add_index :works, [:author_id, :n_size]
  end
end
