# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.delete_all
Product.create!(name: 'Rose',
    description:
    %{
        Rose, genus of some 100 species of perennial 
        shrubs in the rose family (Rosaceae).
        },
    image: 'rose.png',
    price: 15.95)

Product.create!(name: 'Lily',
    description:
    %{
        Lilium is a genus of herbaceous flowering plants
        growing from bulbs, all with large prominent flowers.
            },
    image: 'lily.png',
    price: 13.95)

Product.create!(name: 'Sunflower',
    description:
    %{
        The sunflower (Helianthus annuus) is an annual plant 
        with a sizeable daisy-like flower face.
        },
    image: 'sunflower.png',
    price: 14.95)
