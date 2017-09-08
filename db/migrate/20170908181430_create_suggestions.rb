class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.integer :res_id
      t.integer :vote_up
      t.integer :vote_down
      t.integer :user_id

      t.timestamps
    end
  end
end
