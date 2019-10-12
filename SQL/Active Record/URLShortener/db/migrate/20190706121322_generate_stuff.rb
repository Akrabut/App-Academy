class GenerateStuff < ActiveRecord::Migration[5.2]
  def change
    user1 = User.create!({email:"someemail1@email.com"})
    user2 = User.create!({email:"someotheremail@email.com"})
    user3 = User.create!({email:"randomemail@email.com"})
    user4 = User.create!({email:"email@email.com"})

    url1 = ShortenedUrl.new
    url1.long_url = "www.urlurlurl.com"
    url2 = ShortenedUrl.new
    url2.long_url = "www.anotherurl.com"
    url3 = ShortenedUrl.new
    url3.long_url = "www.random.com"
    url4 = ShortenedUrl.new
    url4.long_url = "www.wat.com"
    url5 = ShortenedUrl.new
    url5.long_url = "www.ok.com"

    Visit.record_visit!(user1, url1)
    Visit.record_visit!(user2, url2)
    Visit.record_visit!(user4, url3)
    Visit.record_visit!(user4, url4)
    Visit.record_visit!(user4, url5)
    Visit.record_visit!(user3, url3)
    #Visit.record_visit!(user1, url1)
  end
end
