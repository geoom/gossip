module ExceptionHandler
    
    extend ActiveSupport::Concern

    # Define custom error subclasses - rescue catches `StandardErrors`
    class AuthenticationError < StandardError; end
    class MissingToken < StandardError; end
    class InvalidToken < StandardError; end
  
    included do

        rescue_from ActiveRecord::RecordInvalid, with: :unprocessable_request
        rescue_from ExceptionHandler::AuthenticationError, with: :unauthorized_request
        rescue_from ExceptionHandler::MissingToken, with: :unprocessable_request
        rescue_from ExceptionHandler::InvalidToken, with: :unprocessable_request

        rescue_from ActiveRecord::RecordNotFound do |e|
            to_http_json({ message: e.message }, :not_found)
        end
    end

    private

    # JSON response with message; Status code 422 - unprocessable entity
    def unprocessable_request(e)
      json_response({ message: e.message }, :unprocessable_entity)
    end
  
    # JSON response with message; Status code 401 - Unauthorized
    def unauthorized_request(e)
      json_response({ message: e.message }, :unauthorized)
    end

  end