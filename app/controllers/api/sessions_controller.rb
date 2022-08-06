module API
  class SessionsController < API::BaseController
    skip_before_action :authorize_request!, only: :create

    def create
      access_token = AuthenticateClient.new(auth_params[:email], auth_params[:password]).call
      success_response({ access_token: access_token }, "Login successfully")
    end

    private

    def auth_params
      params.require(:client).permit(:email, :password)
    end
  end
end
