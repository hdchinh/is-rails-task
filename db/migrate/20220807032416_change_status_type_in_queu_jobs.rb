class ChangeStatusTypeInQueuJobs < ActiveRecord::Migration[6.1]
  def change
    change_column :queue_jobs, :status, :string
  end
end
