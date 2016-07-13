class AddTeamIdToMatchteam < ActiveRecord::Migration
  def change
    add_column :matchteams, :team_id, :integer
  end
end
