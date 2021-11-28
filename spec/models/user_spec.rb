require 'rails_helper'

RSpec.describe 'Userモデルのテスト', type: :model do
  describe 'バリデーションのテスト' do
    subject { user.valid? }

    let!(:other_user) { create(:user) }
    let(:user) { build(:user) }

    context 'nameカラム' do
      it '空欄でないこと' do
        user.name = ''
        is_expected.to eq false
      end
      it '1文字以上であること: 1文字は〇' do
        user.name = Faker::Lorem.characters(number: 1)
        is_expected.to eq true
      end
      it '10文字以下であること: 10文字は〇' do
        user.name = Faker::Lorem.characters(number: 10)
        is_expected.to eq true
      end
      it '10文字以下であること: 11文字は×' do
        user.name = Faker::Lorem.characters(number: 11)
        is_expected.to eq false
      end
      it '一意性があること' do
        user.name = other_user.name
        is_expected.to eq false
      end
    end

    context 'introductionカラム' do
      it '200文字以下であること: 200文字は〇' do
        user.introduction = Faker::Lorem.characters(number: 200)
        is_expected.to eq true
      end
      it '200文字以下であること: 201文字は×' do
        user.introduction = Faker::Lorem.characters(number: 201)
        is_expected.to eq false
      end
    end
  end

  describe 'アソシエーションのテスト' do
    context '各モデルとの関係' do
      it '1:Nとなっている: Tweetモデル' do
        expect(User.reflect_on_association(:tweets).macro).to eq :has_many
      end
      it '1:Nとなっている: Favoriteモデル' do
        expect(User.reflect_on_association(:favorites).macro).to eq :has_many
      end
      it '1:Nとなっている: Replyモデル' do
        expect(User.reflect_on_association(:replies).macro).to eq :has_many
      end
      it '1:Nとなっている: Topicモデル' do
        expect(User.reflect_on_association(:topics).macro).to eq :has_many
      end
      it '1:Nとなっている: Commentモデル' do
        expect(User.reflect_on_association(:comments).macro).to eq :has_many
      end
      it '1:Nとなっている: StudyTimeモデル' do
        expect(User.reflect_on_association(:study_times).macro).to eq :has_many
      end
    end
  end
end
