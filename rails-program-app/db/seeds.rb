# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

languages = ['c', 'c++', 'go', 'haskell', 'java', 'javascript', 'php', 'python', 'ruby', 'rust', 'scala']
languages.each do |language|
  Language.create(name: language)
end
