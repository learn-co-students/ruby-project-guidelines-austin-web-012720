require 'bundler'
Bundler.require
require 'active_record'
ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
RSpotify.authenticate("7b029a62e423464aa2321ae15bd56f86", "8bb31c010b4d4334b47e029baa8e7005")

require_all 'app/models'