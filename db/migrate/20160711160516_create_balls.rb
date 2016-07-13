class CreateBalls < ActiveRecord::Migration
  def change
    create_table :balls do |t|
      t.integer :bowler
      t.integer :batsman
      t.integer :over_id
      t.integer :match_id
      t.integer :delivery
      t.boolean :four
      t.boolean :six
      t.integer :runs
      t.boolean :wicket
      t.integer :catcher
      t.boolean :done
      t.boolean :declared
      t.string :out

      t.timestamps null: false
    end
  end
end
