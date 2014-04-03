require 'spec_helper'

describe Post do
  it { should belong_to :user }

  it { should have_valid(:user).when(User.new) }
  it { should_not have_valid(:user).when(nil) }

  it { should_not have_valid(:image).when(nil, "") }

  it { should have_valid(:description).when(nil, "", ("a"*140)) }
  it { should_not have_valid(:description).when("a"*141) }
end
