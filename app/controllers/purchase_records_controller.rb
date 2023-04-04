class PurchaseRecordsController < ApplicationController
  def index
    @order_form = OrderForm.new
    @item = Item.find(params[:item_id])
  end

  def create
    @item = Item.find(params[:item_id])
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      @order_form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private
  def order_params
    params.require(:order_form).permit(:post_cord, :prefecture_id, :municipality, :address, :building_name, :telephone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end
end
