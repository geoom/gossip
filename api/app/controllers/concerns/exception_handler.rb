module ExceptionHandler
    
    extend ActiveSupport::Concern
  
    included do
        rescue_from ActiveRecord::RecordNotFound do |e|
            to_http_json({ message: e.message }, :not_found)
        end

        rescue_from ActiveRecord::RecordInvalid do |e|
            to_http_json({ message: e.message }, :unprocessable_entity)
        end
    end
  end