require_relative '../config/setup-test'


visit "/"

# Write your test here
#

click_link 'Hello! Access Your Account'
click_link 'Sign In'
fill_in 'user_email', with: 'student@example.com'
fill_in 'user_password', with: 'supersecret'
click_button 'Sign in using our secure server'

click_link 'Stardew Valley'
click_button 'Add to Cart'
click_link 'shopping-cart'
click_link 'Proceed to Checkout'

click_link 'My Fake Amazon'
click_link 'Nintendo Switch - Neon Blue and Red Joy-Con'
click_button 'Add to Cart'
click_link 'shopping-cart'
click_link 'Proceed to Checkout'

fill_in 'shipping_address_addressee', with: 'Bradley Temple'
fill_in 'shipping_address_street_address', with: '2 Miranova Pl'
fill_in 'shipping_address_city', with: 'Columbus'
select 'OH', from: 'shipping_address_state_code'
fill_in 'shipping_address_zip_code', with: '43215'
click_button 'Ship to this address'
fill_in 'payment_method_name_on_card', with: 'Bradley Temple'
fill_in 'payment_method_card_number', with: '4545121212121111'
fill_in 'payment_method_expiration', with: '2020'
fill_in 'payment_method_security_code', with: '123'
click_button 'Add Payment Method'
choose 'order_shipping_method_id_2'
click_link 'Place Your Order'
# Your script will pause on this line and let you play
# with the site in the terminal
binding.pry
