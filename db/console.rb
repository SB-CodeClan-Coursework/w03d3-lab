require ("pry")

require_relative("../models/album")
require_relative("../models/artist")

album1 = Album.new({ 'artist_id' => artist1.id, 'title' => 'Party Time II', 'genre' => 'pop' })

album2 = Album.new({ 'artist_id' => artist2.id, 'title' => 'Barely Music', 'genre' => 'Death Metal' })

binding.binding.pry
nil
