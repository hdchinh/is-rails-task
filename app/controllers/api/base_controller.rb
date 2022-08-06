module API
  class BaseController < ApplicationController
    include ExceptionHandler
    include Message

    before_action :client_authentication!

    protected

    def client_authentication!
      api_key = headers["api-key"].split(" ").last
      raise(ExceptionHandler::MissingApiKey, Message.missing_api_key) if api_key.blank?

      @current_client = Client.find_by(api_key: api_key)
      raise(ExceptionHandler::InvalidApiKey, Message.missing_invalid_api_key) if @current_client.blank?

      # Count access
    end

    def set_pagination_params
      @per_page = params[:per_page].to_i.zero? ? Kaminari.config.default_per_page : params[:per_page].to_i
      @page = params[:page].to_i.zero? ? 1 : params[:page].to_i
    end
  end
end
