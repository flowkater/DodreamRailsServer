class CreateGoalPosts < ActiveRecord::Migration
  def change
    create_table :goal_posts do |t|
      t.string :summary
      t.string :tgoal
      t.references :goal
      t.integer :user_id
      t.string :like
      t.string :support

      t.timestamps
    end
    add_index :goal_posts, :goal_id
  end
end
