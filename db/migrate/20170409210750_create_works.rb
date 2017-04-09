class CreateWorks < ActiveRecord::Migration[5.0]
  def change
    create_table :works do |t|
      t.string :previous_term, null: false
      t.string :next_word, null: false
      t.float :probability, null: false
      t.integer :author_id, null: false
      
    end
  end
end
