module ExceptionHandler
  extend ActiveSupport::Concern

  class MissingApiKey < StandardError
  end
  class InvalidApiKey < StandardError
  end

  included do
    rescue_from ActiveRecord::RecordInvalid, with: :four_twenty_two
    rescue_from ExceptionHandler::MissingApiKey, with: :four_twenty_two
    rescue_from ExceptionHandler::InvalidApiKey, with: :four_twenty_two

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({ message: e.message }, :not_found)
    end
  end

  private

  def four_twenty_two(e)
    json_response({ message: e.message }, :unprocessable_entity)
  end
end
