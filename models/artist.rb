require('pg')

require_relative("../db/sql_runner")

class Artist

  attr_accessor :name
  attr_reader :id

  def initialize( details )
    @id   = details['id'].to_i if details['id']
    @name = details['name']
  end

  def save()
    sql = "INSERT INTO artists
    (
      name
      ) VALUES (
        $1
      )
      RETURNING id;"
      values = [@name]
      @id = SqlRunner.run(sql, values)[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM artists;"
    artists = SqlRunner.run(sql)
    return artists.map{ |artist| Artist.new(artist) }
  end

  def albums
    sql = "SELECT * FROM albums WHERE artist_id = $1"
    values = [@id]
    results = SqlRunner.run(sql, values)
    albums = results.map{ |album| Album.new(album) }
    return albums
  end

  def update
    sql = "UPDATE artists SET name = $1
      WHERE id = $2"
      values = [@name, @id]
      SqlRunner.run(sql, values)
    end

    def delete
      sql = "DELETE FROM artists WHERE id = $1"
      values = [@id]
      SqlRunner.run(sql, values)
    end

    def self.find(id)
      sql = "SELECT * FROM artists WHERE id = $1"
      values = [id]
      results = SqlRunner.run(sql, values)
      artist_hash = results.first
      artist = Artist.new(artist_hash)
      return artist
    end

end
