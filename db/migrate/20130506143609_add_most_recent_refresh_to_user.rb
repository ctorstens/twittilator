class AddMostRecentRefreshToUser < ActiveRecord::Migration
  def change
    add_column :users, :most_recent_refresh, :timestamp # timestamp uses ½ the memory of datetime
  end
end
