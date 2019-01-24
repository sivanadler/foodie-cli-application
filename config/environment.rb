require 'bundler'
Bundler.require
require_relative '../app/models/dish_post'
require_relative '../app/models/restaurant'
require_relative '../app/models/user'

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')

require_all 'lib'
ActiveRecord::Base.logger = nil
# require_relative '../db/seeds'
