require 'rails_helper'

RSpec.describe UserItem, type: :model do
  before do
    @user_item = FactoryBot.build(:user_item)
  end

  describe '商品の購入できる場合' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@user_item).to be_valid
    end
  end

    context "商品が購入できない場合" do
      it 'postalが空だと保存できないこと' do
        @user_item.postal = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal can't be blank", "Postal is invalid. Include hyphen(-)", "Area Prefecture Select")
      end
      it 'postalが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_item.postal = '1234567'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal is invalid. Include hyphen(-)", "Area Prefecture Select")
      end
      it 'area_idを選択していないと保存できないこと' do
        @user_item.area_id = 1
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Area Prefecture Select")
      end
      it 'cityが空だと保存できないこと' do
        @user_item.city = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Area Prefecture Select", "City can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @user_item.block = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Area Prefecture Select", "Block can't be blank")
      end
      it 'numberが空だと保存できないこと' do
        @user_item.number = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Area Prefecture Select", "Number can't be blank", "Number Phone number can't be blank")
      end
    end
  end