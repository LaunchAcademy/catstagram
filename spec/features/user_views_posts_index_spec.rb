require 'spec_helper'

feature "user views posts index", %q{
  As a User
  I want to view all the posts
  So that I can see all the cats of the world
} do

  # Acceptance Criteria
  # - I should see the post's image
  # - I should see the post's description if it has one

  scenario "user views most recent posts" do
    post1 = FactoryGirl.create(:post, :with_description, created_at: Time.now - 3.days)
    post2 = FactoryGirl.create(:post, :with_description, created_at: Time.now - 1.day)
    post3 = FactoryGirl.create(:post, :with_description, created_at: Time.now - 2.days)

    visit root_path

    expect(page).to have_image post2.image.filename
    expect(post2.description).to appear_before post3.description

    expect(page).to have_image post3.image.filename
    expect(post3.description).to appear_before post1.description

    expect(page).to have_image post1.image.filename
  end
end
