ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

desc 'Load core directories'
get "/" do
  load_all './config' if Dir.exists?('./config')
  load_all './app' if Dir.exists?('./app')
  load_all './lib' if Dir.exists?('./lib')
  load_all './*.rb' if Dir.entries('.').include?(/\.rb/)
end
