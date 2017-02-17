require 'sinatra'
require 'sinatra/activerecord'
require './models/quiz.rb'

get '/api/quizzes' do
  headers 'Access-Control-Allow-Origin' => '*'
  Quiz.all.to_json
end

get '/api/quizzes/:id' do
  headers 'Access-Control-Allow-Origin' => '*'
  Quiz.find(params[:id]).to_json
end

get '/api/quizzes/random/:count' do
  headers 'Access-Control-Allow-Origin' => '*'
  range = [*Quiz.first.id..Quiz.last.id]
  count = params[:count].to_i
  Quiz.where(id: range.sample(count)).to_json
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
    kanji:       form['kanji'],
    kana:        form['kana'],
    prefecture:  form['prefecture'],
    level:       form['level'],
    description: form['description'],
    hint:        form['hint']
  }

  quiz = Quiz.new(params)

  if quiz.save
    redirect to('/quizzes', 200)
  else
    redirect to('/quizzes/new')
  end
end

post '/quizzes/:id/update' do |params|
  form = request.env['rack.request.form_hash']['quiz']
  update_params = {
    kanji:       form['kanji'],
    kana:        form['kana'],
    prefecture:  form['prefecture'],
    level:       form['level'],
    description: form['description'],
    hint:        form['hint']
  }
  quiz = Quiz.find(params)

  if quiz.update(update_params)
    redirect to("/quizzes?id=#{form['id']}", 200)
  else
    redirect to("/quizzes/#{params}/edit")
  end
end
