require 'rails_helper'

RSpec.describe Question, type: :model do
  let(:question) { FactoryBot.create(:question) }

  context 'validations check' do
    it { should validate_presence_of(:body) }

    it { should validate_length_of(:body).is_at_most(280) }
  end
end
