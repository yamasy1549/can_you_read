require 'sinatra'
require 'sinatra/activerecord'
require './models/quiz.rb'
require 'pry'

get '/api/posts' do
  Quiz.all.to_json
end

get '/api/posts/:id' do
  Quiz.find(params[:id]).to_json
end

get '/posts' do
  erb :posts, locals: { quizzes: Quiz.all }
end

get '/posts/:id/edit' do
  erb :edit, locals: { quiz: Quiz.find(params[:id]) }
end

post '/posts/:id/update' do |params|
  form = request.env['rack.request.form_hash']['post']
  update_params = {
    kanji:      form['kanji'],
    kana:       form['kana'],
    prefecture: form['prefecture'],
    level:      form['level'],
    hint:       form['hint']
  }

  quiz = Quiz.find(params)

  if quiz.update(update_params)
    redirect to('/posts', 200)
  else
    redirect to('/posts/:id/edit')
  end
end
