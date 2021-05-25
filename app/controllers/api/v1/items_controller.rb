class Api::V1::ItemsController < ApplicationController

  def update
    if @item.update(item_params)
      @item.update_total && @item.save
      @item.invoice.update_total && @item.invoice.save

      render json: @item, status: :accepted
    else
      render json: { errors: item.errors.full_messages }
    end
  end

  def destroy 
    invoice = @item.invoice
    @item.destroy

    invoice.update_total && invoice.save
    render json: { message: "Item Deleted" }
  end

  private

  def item_params
    params.require(:item).permit(:name, :price, :quantity)
  end

  def find_item
    @item = Item.find_by(id: params[:id])
  end
end
