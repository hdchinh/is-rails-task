require "rails_helper"

RSpec.describe QueueJob, type: :model do
  describe "associations" do
    it { is_expected.to belong_to(:client) }
  end
end
