$LOAD_PATH.unshift File.expand_path('../', __FILE__)

require 'jamcity/main'

if ENV['JAMCITY_ENV'] == 'server'
  Jamcity::Main.server
else
  Jamcity::Main.client
end