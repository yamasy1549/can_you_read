require 'dotenv'
Dotenv.load

ActiveRecord::Base.establish_connection(ENV['DATABASE_URL'])

class Quiz < ActiveRecord::Base
  self.table_name = 'quizzes'

  validates :kanji, presence: true
  validates :kana, presence: true
  validates :prefecture, presence: true
  validates :level, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 5 }
  validates :description, presence: true
  validates :hint, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
end
