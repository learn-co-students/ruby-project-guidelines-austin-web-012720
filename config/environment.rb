require 'bundler'
require 'unirest'

Bundler.require

PROMPT = TTY::Prompt.new

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
