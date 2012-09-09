class CreateGoals < ActiveRecord::Migration
  def change
    create_table :goals do |t|
      t.string :name
      t.text :statement
      t.date :startdate
      t.date :enddate
      t.boolean :current, default: false
      t.integer :user_id

      t.timestamps
    end
  end
end
