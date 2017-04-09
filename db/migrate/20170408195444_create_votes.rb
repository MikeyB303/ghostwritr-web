class CreateVotes < ActiveRecord::Migration[5.0]
  def change
    create_table :votes do |t|
      t.integer :voter_id, null: false
      t.integer :votable_id, null: false
      t.string :votable_type, null: false


      t.timestamps
    end
    add_index :votes, [:votable_id, :votable_type]
  end
end
