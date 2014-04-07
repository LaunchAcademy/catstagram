require 'spec_helper'

describe Post do
  it { should belong_to :user }

  it { should have_many(:meows).dependent(:destroy) }

  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }

  it { should_not have_valid(:image).when(nil, "") }

  it { should have_valid(:description).when(nil, "", ("a"*140)) }
  it { should_not have_valid(:description).when("a"*141) }

  describe ".by_recency" do
    it "orders the posts by most recent first" do
      oldest = FactoryGirl.create(:post, created_at: Time.now - 3.days)
      newest = FactoryGirl.create(:post, created_at: Time.now - 1.day)
      middle = FactoryGirl.create(:post, created_at: Time.now - 2.days)

      expect(Post.by_recency).to eq [newest, middle, oldest]
    end
  end

  describe "#has_meow_from?" do
    it "returns true if given user has already created a meow for post" do
      meow = FactoryGirl.create(:meow)
      user = meow.user
      post = meow.post

      expect(post).to have_meow_from user
    end

    it "returns false if given user has not already created a meow for post" do
      user = FactoryGirl.create(:user)
      post = FactoryGirl.create(:post)

      expect(post).to_not have_meow_from user
    end
  end
end
