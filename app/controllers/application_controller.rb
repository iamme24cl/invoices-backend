class ApplicationController < ActionController::API
  include ApiKeyAuthenticatable 
 
  # Require API key authentication                                             
  prepend_before_action :authenticate_with_api_key!
end
