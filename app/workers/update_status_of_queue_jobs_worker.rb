# Run every minutes
class UpdateStatusOfQueueJobsWorker
  include Sidekiq::Worker

  def perform
    QueueJob.find_each do |queue_job|
      job_status = Sidekiq::Status.get_all(queue_job.worker_id).symbolize_keys

      queue_job.update(status: job_status[:status])
    end
  end
end
