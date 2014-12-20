require 'rails_helper'

RSpec.describe User, :type => :model do
  it "has a valid factory" do
    FactoryGirl.build(:user).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:user, name: nil).should_not be_valid
  end

  it "is invalid without an email" do
    FactoryGirl.build(:user, email: nil).should_not be_valid
  end

  it "is invalid without a password" do
    FactoryGirl.build(:user, password: nil).should_not be_valid
  end

  it "passes e-mail validations" do
    FactoryGirl.build(:user)
  end
end
