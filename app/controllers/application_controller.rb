require_relative '../../config/environment'
require_relative '../models/post'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do 
    
  end

  get '/posts/new' do
  	erb :new
  end

  get '/posts' do
  	@posts = Post.all
  	erb :index
  end

  post '/posts' do
		Post.create({name: params[:name], content: params[:content]})
		@posts = Post.all
  	erb :index
	end

  get '/posts/:id' do
  	@post = Post.find_by_id(params[:id])
  	erb :show
  end

  get '/posts/:id/edit' do
  	@post = Post.find_by_id(params[:id])
  	erb :edit
  end

  patch '/posts/:id' do
  	puts params.inspect
		@post = Post.find_by_id(params[:id])	
		@post.update(name: params[:name], content: params[:content])
		erb :show
	end

	delete '/posts/:id/delete' do
		Post.find_by_id(params[:id]).destroy
		redirect :posts
	end
 


end