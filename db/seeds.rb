# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Coin.create!(
    description: "Testando"
    acronym: "TST"
    url_image: "https://cdn.pixabay.com/photo/2014/06/03/19/38/road-sign-361514_960_720.png"
)

Coin.create!(
    description: "Bitcoin"
    acronym: "BTC"
    url_image: "https://logosmarcas.net/wp-content/uploads/2020/08/Bitcoin-Logo.png"
)

Coin.create!(
    description: "Dash"
    acronym: "DASH"
    url_image: "https://www.shareicon.net/data/2016/07/08/117431_dash_512x512.png"
)