require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'



PROMPT = TTY::Prompt.new
# TABLE = TTY::Table.new ['header1','header2','header3','header4','header5','header6'], [['a1', 'a2','a3', 'a4','a5', 'a6'], ['b1', 'b2','b3', 'b4','b5', 'b6']['c1', 'c2','c3', 'c4','c5', 'c6'], ['d1', 'd2','d3', 'd4','d5', 'd6']['e1', 'e2','e3', 'e4','e5', 'e6']]

old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil
