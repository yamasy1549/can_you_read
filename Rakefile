require 'sinatra/activerecord'
require 'sinatra/activerecord/rake'
require './models/quiz.rb'

task :load_csv do
  require 'csv'
  require 'jp_prefecture'

  pref = JpPrefecture::Prefecture

  CSV.foreach('name_of_place.csv', headers: true) do |data|
    prefecture = pref.find(name: data['prefecture'])

    quiz = Quiz.new({
      kanji:           data['kanji'],
      kana:            data['kana'],
      prefecture:      prefecture.name,
      prefecture_code: prefecture.code,
      level:           data['level'].to_i,
      description:     data['description'],
      hint:            data['hint'].to_i
    })

    if quiz.save
      { result: 'success', code: 200 }.to_json
    else
      { result: 'failure' }.to_json
    end
  end
end

task :convert_prefecture_code do
  require 'jp_prefecture'

  pref = JpPrefecture::Prefecture

  Quiz.all.each do |quiz|
    prefecture = pref.find(name: quiz.prefecture)

    if quiz.update(prefecture_code: prefecture.code)
      { result: 'success', code: 200 }.to_json
    else
      { result: 'failure' }.to_json
    end
  end
end
