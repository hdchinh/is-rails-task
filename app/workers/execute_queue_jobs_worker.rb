# Run every minutes
class ExecuteQueueJobsWorker
  include Sidekiq::Worker

  def perform
    # Execute jobs that need to run at specific time
    execute_at_jobs = QueueJob.where.not(execute_at: nil, executed: false)

    execute_at_jobs.each do |queue_job|
      time_by_minutes = (queue_job.execute_at.to_i - Time.current.to_i) / 60

      next if time_by_minutes <= 0

      if queue_job.return_current_time?
        worker_id = ReturnDatetimeWorker.perform_in(time_by_minutes)
      elsif queue_job.store_movie_title?
        worker_id = StoreMovieWorker.perform_in(time_by_minutes, queue_job.id)
      end

      queue_job.update(worker_id: worker_id, executed: true) if worker_id
    end

    # Execute critical jobs
    QueueJob
      .critical
      .where(executed: false)
      .each do |queue_job|
        if queue_job.return_current_time?
          worker_id = ReturnDatetimeWorker.perform_async
        elsif queue_job.store_movie_title?
          worker_id = StoreMovieWorker.perform_async(queue_job.id)
        end

        queue_job.update(worker_id: worker_id, executed: true) if worker_id
      end

    # Execute high jobs
    QueueJob
      .high
      .where(executed: false)
      .each do |queue_job|
        if queue_job.return_current_time?
          worker_id = ReturnDatetimeWorker.perform_async
        elsif queue_job.store_movie_title?
          worker_id = StoreMovieWorker.perform_async(queue_job.id)
        end

        queue_job.update(worker_id: worker_id, executed: true) if worker_id
      end

    # Execute low jobs
    QueueJob
      .low
      .where(executed: false)
      .each do |queue_job|
        if queue_job.return_current_time?
          worker_id = ReturnDatetimeWorker.perform_async
        elsif queue_job.store_movie_title?
          worker_id = StoreMovieWorker.perform_async(queue_job.id)
        end

        queue_job.update(worker_id: worker_id, executed: true) if worker_id
      end
  end
end
