class CreateQueueJobs < ActiveRecord::Migration[6.1]
  def change
    create_table :queue_jobs do |t|
      t.integer :status, default: 0
      t.integer :job_type, default: 0
      t.integer :priority, default: 0

      t.timestamps
    end
  end
end
