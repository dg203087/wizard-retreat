# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)

Wizard.create(email: "dkelley@gmail.com", password: "harry1", first_name: "Deanna", last_name: "Kelley", house: "Gryffindor", admin: true)
Wizard.create(email: "jon@jpk.com", password: "lunarules", first_name: "Jonathon", last_name: "Rosenthal", house: "Slytherin", admin: true)
Course.create(name: "Potions", description: "Mixology with potions from places most exotic.", location: "Dungeons", maximum_participants: 10)
Course.create(name: "Patronus Yoga", description: "Find your true companion in this beginner friendly yoga flow.", location: "Loft", maximum_participants: 20)
