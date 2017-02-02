require 'dotenv'
Dotenv.load

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

class Quiz < ActiveRecord::Base
  self.table_name = 'quizes' if ENV['RACK_ENV'] == 'development'
end
