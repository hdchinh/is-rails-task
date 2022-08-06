require "rails_helper"

RSpec.describe "Sessions", type: :request do
  let!(:client) { create(:client, email: "jean@grey.com", password: "123456") }

  describe "POST /api/login" do
    let(:url) { "/api/login" }

    let(:params) { { client: { email: "jean@grey.com", password: "123456" } } }

    context "when request has valid params" do
      before { post url, headers: { "Accept" => "application/json" }, params: params }

      it "returns :ok" do
        expect(response).to have_http_status(:ok)
      end

      it "returns access_token" do
        expect(json_response["data"]["access_token"]).not_to be_empty
      end
    end

    context "when email is invalid" do
      let(:params) { { client: { email: "noexistingemail@mail.com", password: "123456" } } }

      before { post url, headers: { "Accept" => "application/json" }, params: params }

      it "returns :unauthorized" do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context "when password is invalid" do
      let(:params) { { client: { email: "jean@grey.com", password: "somethingwrong" } } }

      before { post url, headers: { "Accept" => "application/json" }, params: params }

      it "returns :unauthorized" do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
