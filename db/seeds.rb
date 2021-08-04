# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

authors = Author.create([
  { name: 'Erich Gamma' },
  { name: 'Richard Helm' },
  { name: 'Ralph Johnson' },
  { name: 'John Vlissides' }
])

p "Created #{Author.count} authors"

Book.create([
  { title: 'Design Patterns', authors: authors },
  { title: 'DummyBook2', authors: [authors[1], authors[2]] },
  { title: 'DummyBook3', authors: [authors[3], authors[1]] }
])

p "Created #{Book.count} books"
