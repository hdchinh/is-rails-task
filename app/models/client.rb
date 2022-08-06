class Client < ApplicationRecord
  has_secure_password

  has_many :queue_jobs, dependent: :destroy
  has_many :user_metrics, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
