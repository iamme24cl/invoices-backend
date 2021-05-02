class Api::V1::InvoicesController < ApplicationController
  before_action :find_invoice, only: [:show, :update, :destroy]
  before_action :find_account, only: [:index, :create, :update, :destroy]
  
  def index 
    if @account
      invoices = @account.invoices
    else
      invoices = Invoice.all 
    end    
    render json: invoices
  end

  def show
    render json: @invoice
  end

  def create
  end

  def update
  end

  def destroy
  end

  private

  def invoice_params
    params.require(:invoice).permit(
      :payment_due, 
      :description, 
      :payment_terms, 
      :client_name,
      :client_email,
      :client_address 
    )
  end

  def find_invoice
    @invoice = Invoice.find_by(id: params[:id])
  end

  def find_account
    @account = Account.find_by(id: params[:account_id])
  end  
end
