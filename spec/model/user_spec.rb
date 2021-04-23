require 'rails_helper'

RSpec.describe User, :type => :model do
  context 'validate user' do
    it 'Is valid' do
      expect(FactoryBot.create(:user)).to be_valid  
    end
  end

  context 'Associations' do
    it { should have_many (:books)}
  end

  context 'Validations' do
    it {should validate_presence_of(:email)}
    it {should validate_presence_of(:password)}
  end
end
