# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_nokogiri_test_session',
  :secret      => '75ca55828a9bdcd9dbd15b7ce3760d040b715b91e1ef2413b8e094725bd6f33c6532bf35031f63457e0da0cd33a2cbc72e1274b72da1f0d47c7a98553ea1ecdc'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
