require 'rails_helper'



RSpec.describe Book, :type => :model do
  context "Validate model book" do
    it "is valid" do
      expect(FactoryBot.create(:book)).to be_valid 
    end
  end

  context "Associations" do
    it { should belong_to :category }
    it { should belong_to(:created_by).class_name("User") }
  end

  context "Validations" do
    it { should validate_presence_of(:name)}
    it { should validate_presence_of(:author)}
    it { should validate_presence_of(:synopsis)}
    it { should validate_length_of(:synopsis).is_at_most(100)}
  end
  context "Should Respond" do
    it { should respond_to(:name) }
    it { should respond_to(:author) }
    it { should respond_to(:synopsis) }
    it { should respond_to(:category) }
  end
end
