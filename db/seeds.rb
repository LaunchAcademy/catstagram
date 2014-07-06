user = User.create(email: 'seed@example.com', password: 'castagenius')

Dir.foreach('spec/fixtures/') do |file|
  if file.include?('.png')
    image = File.open(File.join(Rails.root, "/db/fixtures/#{file}"))
    Post.create(user: user, image: image)
  end
end
