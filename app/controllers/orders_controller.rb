class OrdersController < ApplicationController
  before_action :set_item, only: [:index, :create]

  def index
    @user_item = UserItem.new
  end

  def create
    @user_item = UserItem.new(item_params)
    if @user_item.valid?
      pay_item
      @user_item.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
    def item_params
      params.require(:user_item).permit(:postal, :area_id, :city, :block, :building, :number, :order_id).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end
  
    def set_item
      @item = Item.find(params[:item_id])
    end

    def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price, 
        card: item_params[:token],    
        currency: 'jpy'                 
      )
    end
end
