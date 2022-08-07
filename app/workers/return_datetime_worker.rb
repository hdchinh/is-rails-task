class ReturnDatetimeWorker
  include Sidekiq::Worker

  def perform
    puts "Current time: #{Time.current}"
  end
end
