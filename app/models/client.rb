class Client < ApplicationRecord
  has_secure_password

  has_many :queue_jobs, dependent: :destroy

  validates :email, presence: true, uniqueness: true
end
