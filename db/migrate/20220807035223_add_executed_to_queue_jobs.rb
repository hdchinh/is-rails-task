class AddExecutedToQueueJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :queue_jobs, :executed, :boolean, default: false
  end
end
