module API
  class QueueJobsController < API::BaseController
    before_action :set_pagination_params, only: [:index]

    def index
      @jobs = QueueJob.page(@page).per(@per_page)
    end

    def create
      @current_client.queue_jobs.create!(queue_job_params.merge(job_params: params[:job_params]))
    end

    private

    def queue_job_params
      params.require(:queue_job).permit(:job_type, :execute_at)
    end
  end
end
