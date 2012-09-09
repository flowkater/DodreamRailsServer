class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :content
      t.references :goal_post
      t.integer :user_id

      t.timestamps
    end
    add_index :comments, :goal_post_id
  end
end
