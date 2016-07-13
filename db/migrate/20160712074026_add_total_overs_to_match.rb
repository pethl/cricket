class AddTotalOversToMatch < ActiveRecord::Migration
  def change
    add_column :matches, :total_overs, :integer
  end
end
