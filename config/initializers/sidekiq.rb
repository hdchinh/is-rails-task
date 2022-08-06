require "redis-namespace"

Sidekiq.configure_server do |config|
  config.redis = {
    ssl_params: {
      verify_mode: OpenSSL::SSL::VERIFY_NONE,
      namespace: "test-august",
      url: "redis://localhost:6379/1"
    }
  }
end

Sidekiq.configure_client do |config|
  config.redis = {
    ssl_params: {
      verify_mode: OpenSSL::SSL::VERIFY_NONE,
      namespace: "test-august",
      url: "redis://localhost:6379/1"
    }
  }
end

# Config for cron jobs
schedule_file = "config/schedule.yml"
Sidekiq::Cron::Job.load_from_hash YAML.load_file(schedule_file) if File.exist?(schedule_file) && Sidekiq.server?
