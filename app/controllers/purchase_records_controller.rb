class PurchaseRecordsController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @purchase_record_form = PurchaseRecordsForm.new
  end
end
