require_relative('../db/sql_runner')
require_relative('album')

class Artist

    attr_reader :id, :name

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
end