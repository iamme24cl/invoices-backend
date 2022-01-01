class Api::V1::InvoicesController < ApplicationController
  before_action :find_invoice, only: [:show, :update, :destroy]
  before_action :find_account, only: [:index, :create, :update, :destroy]
  
  def index 
    if @account
      invoices = @account.invoices.order created_at: :desc
    else
      invoices = Invoice.all.order created_at: :desc 
    end    
    render json: invoices
  end

  def show
    render json: @invoice
  end

  def create
    invoice = @account.invoices.build(invoice_params)
    if invoice.save
      invoice.set_random_code && invoice.update_total
      render json: invoice, status: :accepted
    else
      render json: { errors: invoice.errors.full_messages }
    end
  end

  def update
    @invoice.items.destroy_all
    if @invoice.update(invoice_params)
      @invoice.update_total
      render json: @invoice, status: :accepted
    else
      render json: { errors: @invoice.errors.full_messages }
    end
  end

  def destroy
    id = @invoice.id
    @invoice.destroy

    render json: { message: "Successfully deleted invoice with id: #{id}"}, status: 200
  end

  private

  def invoice_params
    params.require(:invoice).permit(
      :description, 
      :payment_due, 
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
