class Client < ApplicationRecord
  # == Constants ============================================================
  # == Attributes ===========================================================
  has_secure_password

  # == Extensions ===========================================================
  # == Scopes ===============================================================
  # == Relationships ========================================================
  has_many :queue_jobs, dependent: :destroy
  has_many :user_metrics, dependent: :destroy

  # == Validations ==========================================================
  validates :email, presence: true, uniqueness: true

  # == Callbacks ============================================================
  # == Class Methods ========================================================
  # == Instance Methods =====================================================
end
