class Client < ApplicationRecord
  has_many :queue_jobs, dependent: :destroy
end
