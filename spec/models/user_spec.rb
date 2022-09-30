require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { FactoryBot.create(:user) }

  context 'validations check' do
    describe 'presence' do
      it { should validate_presence_of(:name) }
      it { should validate_presence_of(:nickname) }
      it { should validate_presence_of(:email) }
    end

    describe 'length' do
      it { should validate_length_of(:nickname).is_at_most(40) }
    end

    describe 'format' do
      it { should allow_value('a_nickname').for(:nickname) }
      it { should_not allow_value('~~~').for(:nickname) }
    end
  end

  context '#downcase_nickname' do
    let(:user) { FactoryBot.create(:user, nickname: 'NickNaMe') }

    it 'should have nickname downcase' do
      expect(user.nickname).to eq('nickname')
    end
  end
end
