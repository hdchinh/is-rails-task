# Run every months
class UpdateRequestsCountByMonthWorker
  include Sidekiq::Worker

  def perform
    Client.find_each do |client|
      # e.g: "8-2022"
      last_month = "#{Time.current.prev_month.month}-#{Time.current.prev_month.year}"

      UserMetric.create(month: last_month, client: client, total_requests: client.total_requests_last_month)
      client.update(total_requests_last_month: 0)
    end
  end
end
