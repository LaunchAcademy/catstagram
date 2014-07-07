user = User.where(email: 'seed@example.com').first_or_initialize.tap do |u|
 u.password = 'castagenius'
end

Dir.foreach('db/fixtures/') do |file|
  if file.include?('.png')
    image = File.open(File.join(Rails.root, "/db/fixtures/#{file}"))
    Post.create(user: user, image: image)
  end
end
