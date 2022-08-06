module API
  class UsersController < API::BaseController
    skip_before_action :authorize_request!, only: :create

    def create
      @current_client = Client.new(client_params)

      error_response(@current_client.errors.messages) unless @current_client.save
    end

    private

    def client_params
      params.require(:client).permit(:email, :password, :password_confirmation)
    end
  end
end
