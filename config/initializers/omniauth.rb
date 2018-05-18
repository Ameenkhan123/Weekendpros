# OmniAuth.config.logger = Rails.logger

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :google_oauth2, '537086105723-3gpcb20edo3bo6cukq59euc5i5lh9pr0.apps.googleusercontent.com', 'NYgVMxE6baB63zkayhWrRsOE', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
#   provider :facebook, '241531256583193', 'd96334cc809e443f0a2e50934460a521'
#   provider :linkedin, '814qewafhtuz83', 'aA5xTdSPUZJjlTVS'
# end

# Rails.application.config.middleware.use OmniAuth::Builder do
#   provider :twitter, ENV['TWITTER_KEY'], ENV['TWITTER_SECRET']
#   provider :google_oauth2, ENV['537086105723-3gpcb20edo3bo6cukq59euc5i5lh9pr0.apps.googleusercontent.com'], ENV['NYgVMxE6baB63zkayhWrRsOE']
#   provider :facebook, ENV['241531256583193'], ENV['d96334cc809e443f0a2e50934460a521']
#   provider :identity
# end