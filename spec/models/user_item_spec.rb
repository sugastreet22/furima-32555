require 'rails_helper'

RSpec.describe UserItem, type: :model do
  describe '送り先情報を保存' do
    before do
      buyer = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @user_item = FactoryBot.build(:user_item, user_id:buyer.id, item_id:item.id)
      sleep(0.1)
    end

    context '商品の購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_item).to be_valid
      end
      it '建物名が空でも購入できること' do
        @user_item.building = nil
        expect(@user_item).to be_valid
      end
    end

    context "商品が購入できない場合" do
      it 'postalが空だと保存できないこと' do
        @user_item.postal = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal can't be blank", "Postal is invalid. Include hyphen(-)")
      end
      it 'postalが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @user_item.postal = '1234567'
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
      end
      it 'area_idを選択していないと保存できないこと' do
        @user_item.area_id = 1
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Area Prefecture Select")
      end
      it 'cityが空だと保存できないこと' do
        @user_item.city = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空だと保存できないこと' do
        @user_item.block = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Block can't be blank")
      end
      it '電話番号が空だと保存できないこと' do
        @user_item.number = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Number can't be blank", "Number Phone number can't be blank")
      end
      it "電話番号が11桁以内でないと登録できないこと" do
        @user_item.number = "000000000000"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Number Phone number can't be blank")
      end
      it "電話番号が数字のみでないと登録できない" do
        @user_item.number = "0901234567a"
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Number Phone number can't be blank")
      end
      it "tokenが空では登録できないこと" do
        @user_item.token = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Token can't be blank")
      end
      it "user_idが空だと登録できない" do
        @user_item.user_id = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("User can't be blank")
      end
      it "item_idが空だと登録できない" do
        @user_item.item_id = nil
        @user_item.valid?
        expect(@user_item.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end