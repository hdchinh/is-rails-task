# Run every hours
class UpdateRequestsCountWorker
  include Sidekiq::Worker

  def perform
    Client.find_each do |client|
      total_requests_last_month = client.total_requests_last_month + client.total_requests_last_hour
      total_requests_last_hour = 0

      client.update(
        total_requests_last_month: total_requests_last_month,
        total_requests_last_hour: total_requests_last_hour
      )
    end
  end
end
