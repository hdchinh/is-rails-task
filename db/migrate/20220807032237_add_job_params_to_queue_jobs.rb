class AddJobParamsToQueueJobs < ActiveRecord::Migration[6.1]
  def change
    add_column :queue_jobs, :job_params, :jsonb, default: {}
  end
end
