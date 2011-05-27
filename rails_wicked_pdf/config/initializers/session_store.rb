# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pdf_rails_2_session',
  :secret      => 'b47ed2efbc820fc3200899121bb5e5645324e8a8845c440ed9c09c1781eec55b58bc6fe8076e2da4c7a7c8e0b47e54003b0e5f36926764561db596a95e4fe6e1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
