require 'rails_helper'

RSpec.describe MediaPage, :type => :model do
  it "has a valid factory" do
    FactoryGirl.create(:media_page).should be_valid
  end

  it "is invalid without a name" do
    FactoryGirl.build(:media_page, name: nil).should_not be_valid
  end

  it "is invalid without content" do
    FactoryGirl.build(:media_page, content: nil).should_not be_valid
  end
end
