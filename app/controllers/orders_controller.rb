class OrdersController < ApplicationController

  def index
    @user_item = UserItem.new
    @item = Item.find(params[:item_id])
  end

  def create
    # @user_item = UserItem.new(item_params)
    # if @user_item.valid?
    #   @user_item.save
    #   redirect_to action: :index
    # else
    #   render action: :new
    # end
  end

end
