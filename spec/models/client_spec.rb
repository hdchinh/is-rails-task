require "rails_helper"

RSpec.describe Client, type: :model do
  describe "associations" do
    it { is_expected.to have_many(:queue_jobs).dependent(:destroy) }
    it { is_expected.to have_many(:user_metrics).dependent(:destroy) }
  end

  describe "validations" do
    let(:client) { create(:client, email: "chinh@mail.com") }

    it "validates presence of email" do
      expect(client).to validate_presence_of(:email)
    end

    it "validates uniqueness of email" do
      expect(client).to validate_uniqueness_of(:email)
    end
  end
end
