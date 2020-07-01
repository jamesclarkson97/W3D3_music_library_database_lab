require_relative('../db/sql_runner')

class Album

    attr_accessor :id, :title, :genre, :artist_id

    def initialize(options)
        @id = options['id'] if options['id'].to_i
        @title = options['title']
        @genre = options['genre']
        @artist_id = options['artist_id'].to_i
    end

    def save()
        sql = "INSERT INTO albums
        (title, genre, artist_id)
        VALUES ($1, $2, $3)
        RETURNING id"
        values = [@title, @genre, @artist_id]
        result = SqlRunner.run(sql, values)
        @id = result[0]['id'].to_i
    end

    def created_by()
        sql = "SELECT * FROM artists WHERE id = $1"
        values = [@artist_id]
        result = SqlRunner.run(sql, values)
        album_artist = result[0]
        artist = Artist.new(album_artist)
    end

    def self.delete_all()
        sql = "DELETE FROM albums"
        SqlRunner.run(sql)
    end

    def update_info()
        sql = "UPDATE albums SET
        (title, genre, artist_id) 
        = ($1, $2, $3)
        WHERE id = $4"
        values = [@title, @genre, @artist_id, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM albums WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end

    def self.find(id)
        sql = "SELECT * FROM albums WHERE id = $1"
        values = [id]
        results = SqlRunner.run(sql, values)
        album_results = results.first
        album = Album.new(album_results)
        return album
    end

end