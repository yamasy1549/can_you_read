require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './models/quiz.rb'

task :load_csv do
  require 'csv'

  CSV.foreach('name_of_place.csv', headers: true) do |data|
    quiz = Quiz.new({
      kanji:       data['name'],
      kana:        data['kana'],
      prefecture:  data['prefecture'],
      level:       1,
      description: data['description'],
      hint:        1
    })

    if quiz.save
      { result: 'success', code: 200 }.to_json
    else
      { result: 'failure' }.to_json
    end
  end
end
