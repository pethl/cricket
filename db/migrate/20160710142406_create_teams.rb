class CreateTeams < ActiveRecord::Migration
  def change
    create_table :teams do |t|
      t.string :name
      t.string :institute
      t.integer :year
      t.string :rank

      t.timestamps null: false
    end
  end
end
