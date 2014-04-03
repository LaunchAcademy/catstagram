require 'spec_helper'

feature "user adds a post", %q{
  As a User
  I want to make a post
  So that I can share my kitty love with the world
} do

  # Acceptance Criteria
  # - I must be logged in
  # - I must supply an image
  # - I must upload a image from my computer
  # - I can optionally leave a tweet length description

  scenario "user adds a post with valid attributes" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_post_path
    attach_file 'Image', File.join(Rails.root, '/spec/fixtures/sleeping_cat.jpeg')
    fill_in "Description", with: "Sleeping cat"
    click_on "Create Post"

    expect(page).to have_content "Post created successfully."
  end

  scenario "user adds a post with invalid attributes" do
    user = FactoryGirl.create(:user)
    sign_in_as(user)

    visit new_post_path
    click_on "Create Post"

    expect(page).to have_content "There were some errors with your Post."
  end

  scenario "an unauthenticated user tries to add a new post" do
    visit new_post_path
    expect(page).to have_content "You need to sign in or sign up"
  end
end
