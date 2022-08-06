module API
  class BaseController < ApplicationController
    include Response
    include ExceptionHandler

    before_action :authorize_request!

    protected

    def authorize_request!
      @current_client = (AuthorizeAPIRequest.new(request.headers).call)[:client]
    end

    def set_pagination_params
      @per_page = params[:per_page].to_i.zero? ? Kaminari.config.default_per_page : params[:per_page].to_i
      @page = params[:page].to_i.zero? ? 1 : params[:page].to_i
    end
  end
end
