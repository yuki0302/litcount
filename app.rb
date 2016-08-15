require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?
require './models/count.rb'

before do
  if Count.all.size == 0
    Count.create(number: 0)
  end
end

get '/' do
  'Perfume'
end

get '/count' do
  @number = 1 
  erb :index
end

post '/pius' do
  count = Count.first
  count.number = count.number + 1
  count.save
  redirect '/count'
end