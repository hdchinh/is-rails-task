module API
  class QueueJobController
    before_action :set_pagination_params, only: [:index]

    def index
      @jobs = QueueJob.page(@page).per(@per_page)
    end

    def create
      @current_client.queue_jobs.create!(queue_job_params)
    end

    private

    def queue_job_params
      params.require(:queue_jobs).permit(:job_type)
    end
  end
end
