require 'bundler'
Bundler.require
require_relative '../app/models/dish_post'
require_relative '../app/models/restaurant'
require_relative '../app/models/user'
# require_relative '../bin/seed'

DB = ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
