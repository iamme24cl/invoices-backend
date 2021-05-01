class Api::V1::InvoicesController < ApplicationController
  def index 
    account = Account.find_by(id: params[:account_id])

    invoices = account.invoices

    render json: invoices
    
  end
end
