# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_metahome_session',
  :secret      => '5f13aa21bb64136e8519407c5af1352decf32813eea841d3189403fba4149d4fce2b990531028de0ed2ba971b15ac1ee1e7dda60ea18bd8b0eaf6e9f5c0f7878'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
