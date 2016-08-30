class AddCounterToBalls < ActiveRecord::Migration
  def change
    add_column :balls, :counter, :integer
  end
end
