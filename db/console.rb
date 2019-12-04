require("pry")

require_relative("../models/album")
require_relative("../models/artist")

artist1 = Artist.new({ 'name' => 'Bobby Bootscratch'})
artist1.save
artist2 = Artist.new({ 'name' => 'Shane Moug' })
artist2.save

album1 = Album.new({ 'artist_id' => artist1.id, 'title' => 'Party Time II', 'genre' => 'pop' })
album1.save
album2 = Album.new({ 'artist_id' => artist2.id, 'title' => 'Barely Music', 'genre' => 'Death Metal' })
album2.save

binding.pry
nil
