class Api::V1::ApiKeysController < ApplicationController
  include ApiKeyAuthenticatable 
 
  # Require API key authentication                                             
  prepend_before_action :authenticate_with_api_key!, only: %i[index destroy] 

  def index
    account = Account.find_by(id: current_bearer.id) 
    if account
      render json: account
    else
      render json: {status: 401, logged_in: false, account: {}}
    end
  end
 
  def create
    account = Account.find_by email: params[:email] 
    if account&.authenticate(params[:password]) 
        api_key = account.api_keys.create! token: SecureRandom.hex 
        if api_key.save
          render json: account, status: :created
        else
          render status: :unauthorized
        end
    end
  end
 
  def destroy
    api_key = current_bearer.api_keys.find(params[:id]) 

    api_key.destroy 
    render json: {api_keys: current_bearer.api_keys}
  end
end
