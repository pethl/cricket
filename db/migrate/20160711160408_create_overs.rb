class CreateOvers < ActiveRecord::Migration
  def change
    create_table :overs do |t|
      t.integer :match_id
      t.integer :number

      t.timestamps null: false
    end
  end
end
