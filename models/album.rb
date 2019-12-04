require('pg')

class Album

  attr_accessor :title, :genre
  attr_reader :id, :artist_id

  def initialize(details)
    @title       = details['title']
    @genre       = details['genre']
    @id          = details['id'].to_i if album_details['id']
    @artist_id   = details['artist_id'].to_i
  end



























end
