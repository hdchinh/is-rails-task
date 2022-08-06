FactoryBot.define do
  factory :queue_job do
    status { 1 }
    job_type { 1 }
    priority { 1 }
  end
end
