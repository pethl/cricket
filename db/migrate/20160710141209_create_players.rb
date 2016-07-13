class CreatePlayers < ActiveRecord::Migration
  def change
    create_table :players do |t|
      t.string :surname
      t.string :first_name

      t.timestamps null: false
    end
  end
end
