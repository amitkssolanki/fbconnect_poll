# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_fbconnect_poll_session',
  :secret      => '1fd40cf61cec114cd6508e85d879a2e58174d87db1c2d719dbe7a74599a4e4ae8fc0fd9a4f8413ae5a6e6782149aa83b5536a729de5ad4e5c60edc200fbf64fb'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
