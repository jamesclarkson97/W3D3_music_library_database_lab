require('pry-byebug')
require_relative('models/album')
require_relative('models/artist')

# Album.delete_all()
# Artist.delete_all()

artist1 = Artist.new({
    'name' => 'AC/DC',
})
artist1.save()

album1 = Album.new({
    'title' => 'Highway to Hell',
    'genre' => 'Rock',
    'artist_id' => artist1.id
})
album1.save()

album2 = Album.new({
    'title' => 'Back in Black',
    'genre' => 'Rock',
    'artist_id' => artist1.id
})
album2.save()

binding.pry
nil