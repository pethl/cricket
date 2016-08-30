class AddNoballsandwidesToBalls < ActiveRecord::Migration
  def change
     add_column :balls, :no_ball, :boolean
     add_column :balls, :wide, :boolean
  end
end
