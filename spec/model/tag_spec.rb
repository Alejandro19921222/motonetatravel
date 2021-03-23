require 'rails_helper'

RSpec.describe 'Tagモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { .valid? }
    let!(:post) { build(:post, user_id: user.id) }

    context 'titleカラム' do
      it '空欄でないこと' do
        post.title = ''
        is_expected.to eq false
      end
    end

    context 'bodyカラム' do
      it '空欄でないこと' do
        post.body = ''
        is_expected.to eq false
      end
    end
    context 'draftカラム' do
      it '空欄でないこと' do
        post.draft = ''
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Userモデルとの関係' do
      it 'N:1となっている' do
        expect(Post.reflect_on_association(:user).macro).to eq :belongs_to
      end
      it 'Favoriteモデルと1:Nとなっている' do
        expect(Post.reflect_on_association(:favorites).macro).to eq :has_many
      end
      it 'Post_commentモデルと1:Nとなっている' do
        expect(Post.reflect_on_association(:post_comments).macro).to eq :has_many
      end
      it 'Post_imageモデルと1:Nとなっている' do
        expect(Post.reflect_on_association(:post_images).macro).to eq :has_many
      end
      it 'Tag_mapモデルと1:Nとなっている' do
        expect(Post.reflect_on_association(:tag_maps).macro).to eq :has_many
      end
      it 'Tagモデルと1:Nとなっている' do
        expect(Post.reflect_on_association(:tags).macro).to eq :has_many
      end
      it 'Spotモデルと1:1となっている' do
        expect(Post.reflect_on_association(:spot).macro).to eq :has_one
      end
    end
  end
end
