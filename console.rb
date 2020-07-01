require('pry-byebug')
require_relative('models/album')
require_relative('models/artist')

# Album.delete_all()
# Artist.delete_all()

artist1 = Artist.new({
    'name' => 'AC/DC',
})
artist1.save()

# order1 = PizzaOrder.new({
#     'quantity' => 2,
#     'topping' => 'Anchovies',
#     'customer_id' => customer1.id
# })
# order1.save()

binding.pry
nil