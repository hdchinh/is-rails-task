class ReturnDatetimeWorker
  include Sidekiq::Worker
  include Sidekiq::Status::Worker

  def perform
    puts "Current time: #{Time.current}"
  end
end
