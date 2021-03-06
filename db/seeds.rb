raise 'No!' unless Rails.env.development?
include Faker

toby = Teacher.create( name: 'Tools for Teachers', email: 'toby@snaplab.co.uk', password: 'password', password_confirmation: 'password' )
nick = Teacher.create( name: 'Nick T.', email: 'nick@smallfish.net', password: 'f1shes', password_confirmation: 'f1shes' )
abigail = Teacher.create( name: 'Abigail', email: 'abigail.jones@ymail.com', password: 'password', password_confirmation: 'password' )

c = Group.create(teacher: toby, name: "Toby's class")

22.times do
  Student.create(name: Faker::Name.name, group: c)
end

system 'rake asn:scrape_gds'
