ENV["RACK_ENV"] ||= "development"
require 'sinatra/base'
require 'sinatra/flash'
require_relative './lib/link'
require_relative './lib/tag'
require_relative './lib/user'
require_relative 'data_mapper_setup'

class BookmarkManager < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'
  register Sinatra::Flash

  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end

  get '/' do
  	"Hello!"
  end

  get '/links' do
  	@links = Link.all
  	erb :'links/index'
  end

  get '/links/new' do
  	erb :'links/new'
  end

  post '/links' do
    link = Link.new(url: params[:url], title: params[:title])
    params[:tags].split.each do |tag|
      link.tags << Tag.create(name: tag)
    end
    link.save
    redirect '/links'
  end

  get '/tags/:name' do
    tag = Tag.first(name: params[:name])
    @links = tag ? tag.links : []
    erb :'links/index'
  end

  get '/users/new' do
    @user = User.new
    erb :'users/new'
  end

  post '/users' do
    # we just initialize the object
    # without saving it. It may be invalid
    @user = User.new(email: params[:email],
                password: params[:password],
                password_confirmation: params[:password_confirmation])
    if @user.save #save returns true/false depending on whether the model is successfully saved to the database
      session[:user_id] = @user.id
      redirect '/links'
    else #redirect to the sign up form again
      flash.now[:notice] = "Password and confirmation password do match"
      erb :'users/new'
    end
  end

  run! if app_file == $0
end