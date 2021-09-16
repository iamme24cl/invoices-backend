class Api::V1::AccountsController < ApplicationController
  before_action :find_account, only: [:show, :update]

  def index
    @accounts = Account.all
    if @accounts
      render json: @accounts
    else
      render json: {status: 500, errors: @accounts.errors.full_messages}
    end 
  end
  
  def show
    if @account
      render json: @account
    else
      render json: {status: 500, errors: @account.errors.full_messages}
    end
  end

  def create
    # binding.pry
    account = Account.new(account_params)
    if account.save
      # byebug
      api_key = account.api_keys.create! token: SecureRandom.hex
      render json: account, status: :created
    else
      render json: {status: 500, errors: account.errors.full_messages }
    end
  end

  def update
    if @account.update(account_params)
      render json: @account, status: :accepted
    else
      render json: {status: 500, errors: @account.errors.full_messages }
    end
  end

  private

  def account_params
    params.require(:account).permit(:accountname, :email, :password, :address)
  end

  def find_account
    @account = Account.find_by(id: params[:id])
  end
end
