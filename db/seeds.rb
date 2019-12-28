# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Category.create(kind: "食費")
Category.create(kind: "娯楽費")
Category.create(kind: "日用品代")
Category.create(kind: "電気代")
Category.create(kind: "ガス代")
Category.create(kind: "水道代")
Category.create(kind: "通信費")
Category.create(kind: "その他")