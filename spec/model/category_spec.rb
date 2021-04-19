require 'rails_helper'

RSpec.describe Category, :type => :model  do
  context "Validate model category" do
    it "is valid" do
      expect(FactoryBot.create(:category)).to be_valid 
    end
  end
  context "Associations" do
    it { should have_many :books }
  end
  context "Shold Respond" do
    it { should respond_to(:categoriename) }
  end
  context "Validations" do
    it {should validate_presence_of(:categoriename)}
  end 

end