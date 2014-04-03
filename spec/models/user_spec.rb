require 'spec_helper'

describe User do
  it { should have_valid(:password).when("abcd1234", "asd^2jk@%#&!!") }
  it { should_not have_valid(:password).when("abcd123", nil, "") }

  describe "#password_confirmation" do
    subject { FactoryGirl.build(:user, password: "abcd1234") }
    it { should have_valid(:password_confirmation).when("abcd1234") }
    it { should_not have_valid(:password_confirmation).when("asdasd") }
  end

  describe "#email" do
    subject { FactoryGirl.create(:user) }
    it { should have_valid(:email).when("meow@aol.com", "paddington@meow.com") }
    it { should_not have_valid(:email).when("wasd", "kitty.com", "ki@", nil, "") }
    it { should validate_uniqueness_of(:email) }
  end
end
