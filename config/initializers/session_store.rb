# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_kpskills_session',
  :secret      => '32782889a5d9caa15fa091be9ce31777c584bf84025fefe53bb0ceb85b42b560ab1943001442c7c92b262ee4b077bb78f719c8b3f32d95420b80be4d6193d999'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
