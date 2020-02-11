require 'bundler'
require 'tty-prompt'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

PROMPT = TTY::Prompt.new
##^how to use the TTY-prompt gem##

require_all 'lib'
require_all 'app/models'
