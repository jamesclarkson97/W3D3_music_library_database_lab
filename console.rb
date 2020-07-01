require('pry-byebug')
require_relative('models/album')
require_relative('models/artist')

Album.delete_all()
Artist.delete_all()

artist1 = Artist.new({
    'name' => 'AC/DC',
})
artist1.save()

artist2 = Artist.new({
    'name' => 'Metallica'
})
artist2.save()

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

album3 = Album.new({
    'title' => 'Kill \'em All',
    'genre' => 'Metal',
    'artist_id' => artist2.id
})
album3.save()

album4 = Album.new({
    'title' => 'Ride the Lightning',
    'genre' => 'Metal',
    'artist_id' => artist2.id
})
album4.save()

album3.genre = 'Thrash Metal'
album3.update()



binding.pry
nil