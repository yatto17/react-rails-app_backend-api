require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '記事投稿機能' do 
    context '新規投稿ができるとき' do
      it 'title,content,imagesがあれば投稿できる' do
        expect(@post).to be_valid
      end
    end

    context '新規投稿できないとき' do
      it 'titleが空では投稿できない' do
        @post.title = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Title can't be blank")
      end

      it 'contentが空では投稿できない' do
        @post.content = ''
        @post.valid?
        expect(@post.errors.full_messages).to include("Content can't be blank")
      end

      it 'imageが空では投稿できない' do
        @post.images = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("Images can't be blank")
      end

      it 'userが紐付いていないと投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("User must exist")
      end
    end
  end
end
