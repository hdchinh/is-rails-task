require "rails_helper"

RSpec.describe "Users", type: :request do
  let(:params) { { client: { email: "jean@grey.com", password: "123456" } } }

  describe "POST /api/signup" do
    let(:url) { "/api/signup" }

    context "when request has valid params" do
      before { post url, headers: { "Accept" => "application/json" }, params: params }

      it "returns :ok" do
        expect(response).to have_http_status(:ok)
      end
    end

    context "when email is invalid" do
      let(:params) { { client: { email: nil, password: "123456" } } }

      before { post url, headers: { "Accept" => "application/json" }, params: params }

      it "returns :bad_request" do
        expect(response).to have_http_status(:bad_request)
      end

      it "returns message error" do
        expect(json_response["message"]["email"]).not_to be_empty
      end
    end

    context "when email already in used" do
      before do
        create(:client, email: "jean@grey.com", password: "123456")
        post url, headers: { "Accept" => "application/json" }, params: params
      end

      let(:params) { { client: { email: "jean@grey.com", password: "123456" } } }

      it "returns :bad_request" do
        expect(response).to have_http_status(:bad_request)
      end

      it "returns message error" do
        expect(json_response["message"]["email"]).not_to be_empty
      end
    end
  end
end
