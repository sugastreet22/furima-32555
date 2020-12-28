require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品の保存' do
    context "商品が保存できる場合" do
      it "画像、商品名、説明、詳細、カテゴリー、状態、負担、地域、日数、価格があれば商品は保存される" do
        expect(@item).to be_valid
      end
    end

    context "商品が保存できない場合" do
      it "画像がないと商品は保存できない" do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end     
      it "商品名がないと商品は保存できない" do
        @item.product = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it "説明がないと商品は保存できない" do
        @item.explain = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Explain can't be blank")
      end
      it "カテゴリーがないと商品は保存できない" do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it "状態がないと商品は保存できない" do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it "負担がないと商品は保存できない" do
        @item.burden_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden can't be blank")
      end
      it "地域がないと商品は保存できない" do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it "日数がないと商品は保存できない" do
        @item.day_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it "価格がないと商品は保存できない" do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it "半角英数混合では登録できないこと" do
        @item.price = "11aa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid", "Price is not a number")
      end
      it "半角英語だけでは登録できないこと" do
        @item.price = "aaa"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is invalid", "Price is not a number")
      end
      it "299円以下では登録できないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it "10,000,000以上では登録できないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it "ユーザーが紐付いていないと商品は保存できない" do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it "category_idのActiveHashのidが1のときは登録できない" do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it "condition_idのActiveHashのidが1のときは登録できない" do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end
      it "burden_idのActiveHashのidが1のときは登録できない" do
        @item.burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Burden must be other than 1")
      end
      it "area_idのActiveHashのidが1のときは登録できない" do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it "day_idのActiveHashのidが1のときは登録できない" do
        @item.day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
    end
  end
end
