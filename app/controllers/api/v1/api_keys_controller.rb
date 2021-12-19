class Api::V1::ApiKeysController < ApplicationController
  skip_before_action :authenticate_with_api_key!, only: [:create]

  def index
    account = Account.find_by(id: current_bearer.id) 
    if account
      render json: account, status: 200
    else
      render json: { message: 'Please log in!'}, status: 403
    end
  end
 
  def create
    account = Account.find_by email: params[:email] 
    if account&.authenticate(params[:password]) 
        account.api_keys.create! token: SecureRandom.hex 
        render json: account, status: 201
    else
      render json: { error: "Invalid Credentials. Check your email and password!" }, status: 401
    end
  end
 
  def destroy
    api_key = current_bearer.api_keys.find(params[:id]) 
    account = api_key.bearer
    account.api_keys.destroy_all
    render json: { message: "Successfully logged out"}, status: 200
  end
end
