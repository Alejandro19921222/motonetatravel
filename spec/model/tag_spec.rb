require 'rails_helper'

RSpec.describe 'Tagモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { tag.valid? }
    let(:user) { create(:user) }
    let!(:post) { build(:post, user_id: user.id) }

    context 'tag_nameカラム' do
      it '空欄でも問題ないか？' do
        post.tags = ''
        is_expected.to eq true
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context 'Postモデルとの関係' do
      it '1:Nとなっている' do
        expect(Tag.reflect_on_association(:posts).macro).to eq :has_many
      end
      it 'Tag_mapモデルと1:Nとなっている' do
        expect(Tag.reflect_on_association(:tag_maps).macro).to eq :has_many
      end
    end
  end
end
