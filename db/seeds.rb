# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

user_1 = User.create(username: 'GlumpPunk09', role: 1, password: '12345')
user_1 = User.create(username: 'BillyBoy10', role: 0, password: '67890')

creation_1 = Creation.create(artist: 'Pablo Picasso', title: 'Woman with White Hat', type_of_work: 'painting', medium: 'Oil on canvas', dimensions: '40 x 50 cm', date_of_composition: '1947',  art_category: 'cubism', country_of_origin: 'Spain', price: '1600')
creation_2 = Creation.create(artist: 'Eugene Delacroix', title: 'Caravan in the Sahara', type_of_work: 'painting', medium: 'Oil on canvas', dimensions: '35 x 40 cm', date_of_composition: '1833', art_category: 'romanticism', country_of_origin: 'France', price: '2300')

purchase_1 = Purchase.create(user_id: 1, creation_id: 1, sale: true, quantity: 1)
purchase_2 = Purchase.create(user_id: 2, creation_id: 2, sale: true, quantity: 2)
