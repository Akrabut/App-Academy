# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# User.create!(username:"ehad")
# User.create!(username:"shtaim")
# User.create!(username:"shalosh")
# User.create!(username:"arba")
# User.create!(username:"hamesh")
# User.create!(username:"shesh")
# User.create!(username:"sheva")

# Artwork.create!(title:"hi", image_url: "www.hi.com", artist_id: 1)
# Artwork.create!(title:"hi", image_url: "www.hi.com", artist_id: 2)
# Artwork.create!(title:"hi", image_url: "www.hiiiiiiiii.com", artist_id: 1)
# Artwork.create!(title:"a title", image_url: "www.watttttt.com", artist_id: 1)
# Artwork.create!(title:"shtaim's pic", image_url: "www.okkkkk.com", artist_id: 2)
# Artwork.create!(title:"shaloshhhhh", image_url: "www.lol.com", artist_id: 3)
# Artwork.create!(title:"arba's pic", image_url: "www.lolol.com", artist_id: 4)
# Artwork.create!(title:"some title", image_url: "www.lmao.com", artist_id: 4)
# Artwork.create!(title:"6 has no pic", image_url: "www.url.com", artist_id: 5)
# Artwork.create!(title:"7's picture", image_url: "www.aaaaaaaaaa.com", artist_id: 7)

# ArtworkShare.create!(viewer_id: 1, artwork_id: 4)
# ArtworkShare.create!(viewer_id: 6, artwork_id: 1)
# ArtworkShare.create!(viewer_id: 6, artwork_id: 2)
# ArtworkShare.create!(viewer_id: 6, artwork_id: 3)
# ArtworkShare.create!(viewer_id: 2, artwork_id: 3)
# ArtworkShare.create!(viewer_id: 7, artwork_id: 3)
# ArtworkShare.create!(viewer_id: 5, artwork_id: 7)
# ArtworkShare.create!(viewer_id: 4, artwork_id: 1)
# ArtworkShare.create!(viewer_id: 1, artwork_id: 4)

Comment.create(user_id: 7, artwork_id: 2, body: 'Hiiiiiiiiiiii this is the first comment!#@$@#%@')
Comment.create(user_id: 2, artwork_id: 8, body: 'A COMMENT IN CAPS LOCK')
Comment.create(user_id: 1, artwork_id: 10, body: 'SOME OTHER COMMENT IN CAPS LOCK')
Comment.create(user_id: 3, artwork_id: 5, body: 'LULULU')
Comment.create(user_id: 5, artwork_id: 1, body: 'stam comment')
Comment.create(user_id: 6, artwork_id: 3, body: 'another comment')
Comment.create(user_id: 7, artwork_id: 2, body: 'aw3i78yrona8w7bn3r8asw834n4w6')
Comment.create(user_id: 4, artwork_id: 4, body: 'looks like a password of mine')
Comment.create(user_id: 4, artwork_id: 6, body: 'jst another commentttttttt')
Comment.create(user_id: 1, artwork_id: 6, body: '!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!')
Comment.create(user_id: 4, artwork_id: 7, body: 'wat')
Comment.create(user_id: 6, artwork_id: 2, body: 'hellllllllloooooOOOoOOOooOOOO')