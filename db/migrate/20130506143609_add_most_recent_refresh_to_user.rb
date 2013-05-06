class AddMostRecentRefreshToUser < ActiveRecord::Migration
  def change
    add_column :users, :most_recent_refresh, :timestamp,  :default => Time.now.getutc - 100000000# timestamp uses ½ the memory of datetime
  end
end
