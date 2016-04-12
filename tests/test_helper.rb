require "minitest/autorun"
require "minitest/rg"
require "sinatra/activerecord"

Dir[File.expand_path("./") + "/app/*/*.rb"].each { |file| require file}
