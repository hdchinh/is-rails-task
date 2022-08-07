namespace :run_queue_job do
  task :start, %i[queue_job_id] do |task, args|
    queue_job = QueueJob.find(args[:queue_job_id])

    if queue_job.return_current_time?
      worker_id = ReturnDatetimeWorker.perform_async
    elsif queue_job.store_movie_title?
      worker_id = StoreMovieWorker.perform_async(queue_job.id)
    end

    queue_job.update(worker_id: worker_id, executed: true) if worker_id
  end
end
