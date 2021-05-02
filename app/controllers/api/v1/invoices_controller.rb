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
    invoice = @account.invoices.build(invoice_params)
    if invoice.save
      invoice.update_total
      render json: invoice, status: :accepted
    else
      render json: { errors: invoice.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def update
    if @invoice.update(invoice_params)
      @invoice.update_total
      render json: @invoice, status: :accepted
    else
      render json: { errors: @invoice.errors.full_messages }, status: :unprocessible_entity
    end
  end

  def destroy
  end

  private

  def invoice_params
    params.require(:invoice).permit(
      :payment_due, 
      :description, 
      :payment_terms,
      :status, 
      :client_name,
      :client_email,
      :client_address,
      :items_attributes => [:name, :price, :quantity]
    )
  end

  def find_invoice
    @invoice = Invoice.find_by(id: params[:id])
  end

  def find_account
    @account = Account.find_by(id: params[:account_id])
  end  
end
