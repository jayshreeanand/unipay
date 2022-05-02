# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


images = [
  'https://randomuser.me/api/portraits/men/75.jpg',
]

names = ['Kingston',
'Vincent',
'Brett',
'Hunter',
'Franco',
'Messiah',
'Jaydin',
'Jordyn',
'Jakobe',
'Zaire',
'Terrance',
'Kasey'
]
names.each do |name|
  c = Contact.new
  c.name = name
  c.avatar = "https://randomuser.me/api/portraits/men/#{rand(1..100)}.jpg"
  c.payid = name.downcase
  c.save!

names_new = [
  'Lia'
'Genesis'
'Adison'
'Piper'
'Akira'
'Elsie'
]

names_new.each do |name|
  c = Contact.new
  c.name = name
  c.avatar = "https://randomuser.me/api/portraits/women/#{rand(1..100)}.jpg"
  c.payid = name.downcase
  c.save!