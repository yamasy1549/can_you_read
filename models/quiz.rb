ActiveRecord::Base.establish_connection('sqlite3:///model.db')

class Quiz < ActiveRecord::Base
  self.table_name = 'quizes'
end
