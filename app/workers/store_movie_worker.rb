class StoreMovieWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform(queue_job_id)
    queue_job = QueueJob.find(queue_job_id)
    Movie.create(title: queue_job.job_params[:title])
  end
end
