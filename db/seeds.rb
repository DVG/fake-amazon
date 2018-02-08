puts "====> Seeding Development Database With Data"

def upload_image(image_name, product: nil)
  pi = ProductImage.find_or_create_by(product: product, original_filename: image_name)
  pi.image = Rails.root.join("db/seeds/images/#{image_name}").open
  pi.save
end

puts "====> Creating Video Games Category"
video_games = Category.find_or_create_by name: "Video Games"

puts "====> Creating Products"
switch = Product.find_or_create_by(name: 'Nintendo Switch - Neon Blue and Red Joy-Con', list_price: 299.99, price: 298.99, category: video_games)
upload_image "switch_001.jpg", product: switch
upload_image "switch_002.jpg", product: switch
upload_image "switch_003.jpg", product: switch

mario = Product.find_or_create_by(name: "Super Mario Odyssey", list_price: 59.99, price: 48.66, category: video_games)

upload_image "mario_001.jpg", product: mario
upload_image "mario_002.jpg", product: mario

zelda = Product.find_or_create_by(name: 'The Legend of Zelda: Breath of the Wild', list_price: 59.99, price: 52.00, category: video_games)
upload_image "zelda_001.jpg", product: zelda
upload_image "zelda_002.jpg", product: zelda
upload_image "zelda_003.jpg", product: zelda

stardew = Product.find_or_create_by(name: 'Stardew Valley', list_price: 19.99, price: 14.99, category: video_games)
upload_image "stardew_001.jpg", product: stardew
upload_image "stardew_002.jpg", product: stardew
upload_image "stardew_003.jpg", product: stardew

puts "====> Creating Shipping Methods"
ShippingMethod.find_or_create_by identifier: ShippingMethod::STANDARD_SHIPPING, name: "Standard Shipping", price_per_item: 5.99
ShippingMethod.find_or_create_by identifier: ShippingMethod::SUPER_SAVER_SHIPPING, name: "FREE Super Saver Shipping", price_per_item: 0
ShippingMethod.find_or_create_by identifier: ShippingMethod::PRIME_TWO_DAY, name: "FREE Prime 2-Day Shipping", price_per_item: 0
ShippingMethod.find_or_create_by identifier: ShippingMethod::PRIME_ONE_DAY, name: "$3.99 Prime Overnight Shipping", price_per_item: 3.99
ShippingMethod.find_or_create_by identifier: ShippingMethod::PRIME_NO_RUSH, name: "FREE No-Rush Shipping", price_per_item: 0

puts "====> Creating Default User"
bradley = User.find_or_initialize_by(email: "bradley.temple@gmail.com", username: "DVG")
bradley.password = 'supersecret'
bradley.password_confirmation = 'supersecret'
bradley.save
