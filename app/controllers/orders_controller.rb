class OrdersController < ApplicationController

  def index
    @user_item = UserItem.new
    @item = Item.find(params[:item_id])
  end

  def create
    @user_item = UserItem.new(item_params)
    if @user_item.valid?
      @user_item.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
    def item_params
      params.require(:user_item).permit(:postal, :area_id, :city, :block, :building, :number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id])
    end
  
end
