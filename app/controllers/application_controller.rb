class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  rescue_from StandardError do |e|
    render json: {
             success: false,
             message: "Something went wrong, please try it later.",
             error_type: e.class,
             error_message: e.message
           },
           status: 422
  end
end
