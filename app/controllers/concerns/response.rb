module Response
  def success_response(object = {}, message = "", status = :ok)
    render json: { success: true, message: message, data: object }, status: status
  end

  def error_response(error_msg = {}, status = :bad_request)
    render json: { message: error_msg }, status: status
  end

  def json_response(object, status = :ok)
    render json: object, status: status
  end
end
