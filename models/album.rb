require('pg')

require_relative("../db/sql_runner")


class Album

  attr_accessor :title, :genre
  attr_reader :id, :artist_id

  def initialize(details)
    @id          = details['id'].to_i if details['id']
    @title       = details['title']
    @genre       = details['genre']
    @artist_id   = details['artist_id'].to_i
  end


  def save()
    sql = "INSERT INTO albums
    (
      title,
      genre,
      artist_id
      ) VALUES (
        $1, $2, $3
      )
      RETURNING id"
      values = [@title, @genre, @artist_id]
      @id = SqlRunner.run(sql, values)[0]["id"].to_i
    end


    def self.all()
      sql = "SELECT * FROM albums;"
      albums = SqlRunner.run(sql)
      return albums.map{ |album| Album.new(album) }
    end

    def artist
      sql = "SELECT * FROM artists WHERE id = $1"
      values = [@artist_id]
      results = SqlRunner.run(sql, values)
      artist_data = results[0]
      artist = Artist.new(artist_data)
      return artist
    end

    def update
      sql = "UPDATE albums SET (
        title,
        genre,
        artist_id
        ) = ($1, $2, $3)
        WHERE id = $4"
        values = [@title, @genre, @artist_id, @id]
        SqlRunner.run(sql, values)
      end

      def delete
        sql = "DELETE FROM albums WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
      end

      def self.find(id)
        sql = "SELECT * FROM albums WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values)
        album_hash = results.first
        album = Album.new(album_hash)
        return album
      end

end
