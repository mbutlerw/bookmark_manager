
ENV['RACK_ENV'] ||= "development"
require 'sinatra/base'
require_relative 'data_mapper_setup'


class BookmarkManager < Sinatra::Base
  get '/' do
    redirect '/links'
  end

  get '/links' do
  	@links = Link.all
  	erb(:'links/index')
  end

  get '/links/new' do
  	erb(:'links/new')
  end
  
  post '/links' do
  	link = Link.new(url: params[:url], title: params[:title])
    params[:tags].gsub(' ', '').split(',').each {|tag| link.tags << Tag.first_or_create(name: tag) }
  	link.save
  	redirect('/links')
  end

  get '/tags/:tag' do
    tag = Tag.first(name: params[:tag])
    @links = tag ? tag.links : []
    erb(:'links/index')
  end

  run! if app_file == $0
end
