class AddIsOutToMatchteam < ActiveRecord::Migration
  def change
    add_column :matchteams, :is_out, :boolean
  end
end
