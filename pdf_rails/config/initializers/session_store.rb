# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pdf_session',
  :secret      => '927c57e14cbc082ea982408507f4086fbaf68add88d4f5e6e7e1a8348ed1788b26085d7c8bfbc164be6f9cd49b9644b68f360c3ccfd2332ce08b8336e83501e2'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
