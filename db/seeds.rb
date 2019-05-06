# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)



Category.create(name: 'Activities')
Category.create(name: 'Food')
Category.create(name: 'Tasks')
Category.create(name: 'Hotel')
Category.create(name: 'Flight')
Category.create(name: 'Miscellaneous')








ToDo.create(details: 'universal', date: Date.parse('14/07/2019'), category: 1, trip: 1)
ToDo.create(details: 'GBB', date: Date.parse('21/05/2019'), category: 2, trip: 2)