require_relative('../db/sql_runner')
require_relative('album')

class Artist

    attr_accessor :name
    attr_reader :id

    def initialize(options)
        @id = options['id'] if options['id']
        @name = options['name']
    end

    def save()
        sql = "INSERT INTO artists (name)
        VALUES ($1)
        RETURNING id"
        values = [@name]
        result = SqlRunner.run(sql, values)
        @id = result[0]['id'].to_i
    end

    def albums_made()
        sql = "SELECT * FROM albums WHERE artist_id = $1"
        values = [@id]
        result = SqlRunner.run(sql, values)
        discography = result.map {|album| Album.new(album)}
        return discography
    end

    def self.delete_all()
        sql = "DELETE FROM artists"
        SqlRunner.run(sql)
    end

    def update_name()
        sql = "UPDATE artists SET
        name
        = $1
        WHERE id = $2"
        values = [@name, @id]
        SqlRunner.run(sql, values)
    end

    def delete()
        sql = "DELETE FROM artists WHERE id = $1"
        values = [@id]
        SqlRunner.run(sql, values)
    end
end