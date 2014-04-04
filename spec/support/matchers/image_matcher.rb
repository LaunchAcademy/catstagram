# Adding A ‘has_image?’ Matcher To Capybara
# http://lostechies.com/derickbailey/2011/09/27/adding-a-has_image-matcher-to-capybara/

module Capybara
  class Session
    def has_image?(src)
      has_xpath?("//img[contains(@src, \"#{src}\")]")
    end
  end
end
