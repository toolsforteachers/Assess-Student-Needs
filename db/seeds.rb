# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

toby = Teacher.create( name: 'Toby P.', email: 'toby@snaplab.co.uk', password: 'password', password_confirmation: 'password' )
nick = Teacher.create( name: 'Nick T.', email: 'nick@smallfish.net', password: 'f1shes', password_confirmation: 'f1shes' )

alice = Student.create(name: 'Alice')
ben = Student.create(name: 'Ben')
clare = Student.create(name: 'Clare')
dave = Student.create(name: 'Dave')


apples = Group.create(name: 'Apples', teacher: toby)
apples.students << alice
apples.students << ben
apples.students << clare
apples.students << dave
apples.save!
