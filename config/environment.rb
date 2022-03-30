# Load the Rails application.
require_relative 'application'

# Initialize the Rails application.
Rails.application.initialize!

# Internationalization i18n -v 7.0.0
# the locales which have to be loaded via
config.i18n.available_locales = ['fr-FR', :fr]
