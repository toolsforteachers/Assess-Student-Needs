# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

teacher = Teacher.create( name: 'Toby P.', email: 'toby@snaplab.co.uk', password: 'password', password_confirmation: 'password' )

Indicator.create(level: 3, name: 'Easy Adding Up')
Indicator.create(level: 3, name: 'Harder Multiplication')
Indicator.create(level: 3, name: 'Difficult Trigonometry')