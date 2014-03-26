n# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Category.delete_all
Difficulty.delete_all
Pattern.delete_all
Row.delete_all
Stitch.delete_all
Color.delete_all

Category.create name: 'ladies'
Category.create name: 'men'
Category.create name: 'children'
Category.create name: 'baby'
Category.create name: 'holiday'
Category.create name: 'basic'

Difficulty.create name: 'beginner'
Difficulty.create name: 'easy'
Difficulty.create name: 'intermediate'
Difficulty.create name: 'advanced'

User.create name:'Kriszta', email: 'kriszta@kriszta.com', password: 'password', role: 'admin'
User.create name:'Tim', email: 'tim@tim.com', password: 'password', role: 'registered'
User.create name:'Nico', email: 'nico@nico.com', password: 'password', role: 'registered'
User.create name:'Max', email: 'max@max.com', password: 'password', role: 'registered'

Color.create color: "red"
Color.create color: "blue"
Color.create color: "yellow"
Color.create color: "green"
Color.create color: "white"
Color.create color: "black"

