# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Product.delete_all
# . . . 
Product.create(:title => 'Programing Ruby 1.9',
  :description =>
    %{ <p>
        Ruby is fun! and stuff...
      </p>
    },
  :image_url => 'images/ruby.jpg',
  :price => 49.50)

