require "rails_helper"

RSpec.describe "QueueJobs", type: :request do
  let!(:client) { create(:client, email: "jean@grey.com", password: "123456") }
  let(:valid_token) { JsonWebToken.encode(client_id: client.id) }

  describe "GET /api/queue_jobs" do
    let(:url) { "/api/queue_jobs" }

    context "when request has valid token" do
      before { get url, headers: { "Accept" => "application/json", :"Authorization" => valid_token }, params: {} }

      it "returns :ok" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "when request has invalid token" do
      let(:params) { { client: { email: "noexistingemail@mail.com", password: "123456" } } }

      before { get url, headers: { "Accept" => "application/json", :"Authorization" => "somethingelse" }, params: {} }

      it "returns :unprocessable_entity" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end

    context "when request does not have token" do
      let(:params) { { client: { email: "noexistingemail@mail.com", password: "123456" } } }

      before { get url, headers: { "Accept" => "application/json" }, params: {} }

      it "returns :unprocessable_entity" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe "POST /api/queue_jobs" do
    let(:url) { "/api/queue_jobs" }
    let(:params) { { queue_job: { job_type: "return_current_time" } } }

    context "when request has valid token" do
      subject { post url, headers: { "Accept" => "application/json", :"Authorization" => valid_token }, params: params }

      it "returns :ok" do
        subject
        expect(response).to have_http_status(:ok)
      end

      it "increases queue_jobs" do
        expect { subject }.to change(QueueJob, :count).by(1)
      end
    end

    context "when request has invalid token" do
      let(:params) { { client: { email: "noexistingemail@mail.com", password: "123456" } } }

      before do
        post url, headers: { "Accept" => "application/json", :"Authorization" => "somethingelse" }, params: params
      end

      it "returns :unprocessable_entity" do
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
