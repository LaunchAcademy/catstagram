require 'spec_helper'

describe Meow do
  before { FactoryGirl.create(:meow) }

  it { should belong_to :user }
  it { should belong_to :post }

  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }

  it { should have_valid(:post).when(Post.new) }
  it { should_not have_valid(:post).when(nil) }

  it { should validate_uniqueness_of(:post_id).scoped_to(:user_id) }
end
