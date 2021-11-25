require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '新規投稿' do
    context '新規投稿できる' do
      it '全項目入力すると投稿できる' do
        expect(@item).to be_valid
      end
    end

    context '新規投稿できない' do
      it 'タイトルが空だと投稿できない' do
        @item.name = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '画像を選択しないと投稿できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '本文が空だと投稿できない' do
        @item.introduction = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduction can't be blank")
      end
      it 'ジャンルを選択しないと投稿できない' do
        @item.genre_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Genre can't be blanck")
      end
      it 'ユーザーが紐づいてないと投稿できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
    end
  end
end
