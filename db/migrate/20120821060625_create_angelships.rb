class CreateAngelships < ActiveRecord::Migration
  def change
    create_table :angelships do |t|
      t.integer :angel_id
      t.integer :dreamer_id

      t.timestamps
    end

    add_index :angelships, :angel_id
    add_index :angelships, :dreamer_id
    add_index :angelships, [:angel_id, :dreamer_id], unique: true
  end
end
