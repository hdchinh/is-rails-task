class CreateUserMetrics < ActiveRecord::Migration[6.1]
  def change
    create_table :user_metrics do |t|
      t.string :month
      t.integer :total_requests, default: 0

      t.timestamps
    end
  end
end
