
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#read
  get '/posts' do
    @posts = Post.all
    erb :index
  end

#create
  get '/posts/new' do
    @post = Post.new
    erb :new
  end

  post '/posts' do
    @post = Post.create(params)
    redirect "/posts"
  end

#read, delete
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end

#update
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.update({name: params[:name], content: params[:content]})
    redirect "/posts/#{@post.id}"
  end

  delete '/posts/:id' do
    @post = Post.find(params[:id])
    @post.delete
    erb :delete
  end
end
