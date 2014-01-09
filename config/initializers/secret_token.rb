# Be sure to restart your server when you modify this file.

# Your secret key is used for verifying the integrity of signed cookies.
# If you change this key, all old signed cookies will become invalid!

# Make sure the secret is at least 30 characters and all random,
# no regular words or you'll be exposed to dictionary attacks.
# You can use `rake secret` to generate a secure secret key.

# Make sure your secret_key_base is kept private
# if you're sharing your code publicly.
#SampleApp::Application.config.secret_key_base = '7518854f555b40cffe7f0ecc000852f54976c78fca905494b97c3ddc2112c6c417380cbfea65dd7261feaef6431c54751f3ea15f0f82ab1fe9118b33cdd3acf8'
require 'securerandom'

def secure_token
	token_file=Rails.root.join('.secret')
	if File.exist?(token_file)
		#use the existing token
		File.read(token_file).chop
	else
		#generate a new token and store it in the token file
		token=securerandom.hex(64)
		File.write(token_file,token)
		token
	end
end
SampleApp::Application.config.secret_key_base = secure_token