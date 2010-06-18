# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Convivo_session',
  :secret      => 'cd08da27b3d5b3ff87bd2b3fe5c37aa04963390da222d5de2c0f14634ab4d239d9ab4ca420dcc05bc381acd2762df0bfa529dd5b9b3f5b143afab45a9a88e0e5'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
