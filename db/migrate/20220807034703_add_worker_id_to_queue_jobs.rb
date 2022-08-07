class AddWorkerIdToQueueJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :queue_jobs, :worker_id, :string
  end
end
