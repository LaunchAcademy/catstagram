
images = [
  'http://photos-f.ak.instagram.com/hphotos-ak-xpa1/10483420_661769070567613_1395036593_n.jpg',
  'http://photos-h.ak.instagram.com/hphotos-ak-xpa1/926492_816465215038351_1736096620_n.jpg',
  'http://scontent-a-lga.cdninstagram.com/hphotos-xfp1/t51.2885-15/10467696_759538677418639_104794203_n.jpg',
  'http://scontent-a-lga.cdninstagram.com/hphotos-xpa1/t51.2885-15/10513771_346312405518201_1850422148_n.jpg',
  'http://photos-e.ak.instagram.com/hphotos-ak-xpf1/10413034_1385818795000140_246563306_n.jpg',
  'http://photos-h.ak.instagram.com/hphotos-ak-xpa1/10251386_283934351776407_1615977570_n.jpg',
  'http://photos-a.ak.instagram.com/hphotos-ak-xfp1/10401715_494591350641224_386631984_n.jpg',
  'http://scontent-a-lga.cdninstagram.com/hphotos-xap1/l/t51.2885-15/10254075_1411038895840833_1431657828_n.jpg',
  'http://photos-d.ak.instagram.com/hphotos-ak-xpa1/1171964_224503407743803_842803977_n.jpg',
  'http://photos-e.ak.instagram.com/hphotos-ak-xaf1/10009345_621570251261916_426895815_n.jpg'
]

images.each do |image|
  FactoryGirl.create(:post, remote_image_url: image)
end
