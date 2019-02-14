class ApiController < ApplicationController

  #Turning off request forgery protection
  protect_from_forgery with: :null_session
  # this module is supposed to generalized responses for not_found and bad_request(s)
  include ExceptionHandler
  # inherited controllers are expected to respond to json only
  respond_to :json

end
