class CreateMatchteams < ActiveRecord::Migration
  def change
    create_table :matchteams do |t|
      t.integer :match_id
      t.integer :player_id
      t.integer :out
      t.integer :batting_order

      t.timestamps null: false
    end
  end
end
