class AddMonitorColumnsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :clients, :total_requests_last_hour, :integer, default: 0
    add_column :clients, :total_requests_last_month, :integer, default: 0
  end
end
