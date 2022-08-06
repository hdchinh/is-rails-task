class AddClientToQueueJobs < ActiveRecord::Migration[6.1]
  def change
    add_reference :queue_jobs, :client, null: false, foreign_key: true
  end
end
