require('pg')

require_relative("../db/sql_runner")


class Album

  attr_accessor :title, :genre
  attr_reader :id, :artist_id

  def initialize(details)
    @title       = details['title']
    @genre       = details['genre']
    @id          = details['id'].to_i if details['id']
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


























end
