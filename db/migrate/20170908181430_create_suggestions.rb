class CreateSuggestions < ActiveRecord::Migration[5.1]
  def change
    create_table :suggestions do |t|
      t.integer :res_id
      t.integer :vote_up
      t.integer :vote_down
      t.string :username
      t.integer :user_id
      t.string :res_name
      t.string :res_cuisines
      t.string :res_location
      t.string :res_menu_url
      t.string :res_image
      t.string :res_url
      t.float :res_user_rating
      t.string :room_id

      t.timestamps
    end
  end
end
