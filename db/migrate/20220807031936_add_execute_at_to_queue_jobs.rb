class AddExecuteAtToQueueJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :queue_jobs, :execute_at, :datetime
  end
end
