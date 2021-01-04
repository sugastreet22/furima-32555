class OrdersController < ApplicationController

  def index
  end

  def create
    @user_item = UserItem.new(item_params)
    if @user_item.valid?
      @user_item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

end
