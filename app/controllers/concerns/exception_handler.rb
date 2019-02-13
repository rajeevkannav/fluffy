module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    # rescue_from ActiveRecord::RecordNotFound do |e|
    #   json_response({ message: e.message }, :not_found)
    # end

    rescue_from(Mongoid::Errors::DocumentNotFound) do |e|
      render status: :not_found, json: {message: e.message}
    end

    rescue_from(Mongoid::Errors::Validations) do |e|
      render status: :unprocessable_entity, json: {message: e.message}
    end

    # rescue_from ActiveRecord::RecordInvalid do |e|
    #   json_response({ message: e.message }, :unprocessable_entity)
    # end
  end
end