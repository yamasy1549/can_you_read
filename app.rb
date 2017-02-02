require 'sinatra'
require 'sinatra/activerecord'
require './models/quiz.rb'

get '/api/quizzes' do
  Quiz.all.to_json
end

get '/api/quizzes/:id' do
  Quiz.find(params[:id]).to_json
end

get '/quizzes' do
  erb :index, locals: { quizzes: Quiz.order('id') }
end

get '/quizzes/new' do
  erb :new
end

get '/quizzes/:id/edit' do
  erb :edit, locals: { quiz: Quiz.find(params[:id]) }
end

post '/quizzes/create' do
  form = request.env['rack.request.form_hash']['quiz']
  params = {
    kanji:      form['kanji'],
    kana:       form['kana'],
    prefecture: form['prefecture'],
    level:      form['level'],
    hint:       form['hint']
  }

  quiz = Quiz.new(params)

  if quiz.save!
    redirect to('/quizzes', 200)
  else
    redirect to('/quizzes/:id/edit')
  end
end

post '/quizzes/:id/update' do |params|
  form = request.env['rack.request.form_hash']['quiz']
  update_params = {
    kanji:      form['kanji'],
    kana:       form['kana'],
    prefecture: form['prefecture'],
    level:      form['level'],
    hint:       form['hint']
  }
  quiz = Quiz.find(params)

  if quiz.update(update_params)
    redirect to('/quizzes', 200)
  else
    redirect to('/quizzes/:id/edit')
  end
end
