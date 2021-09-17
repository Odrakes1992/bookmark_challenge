require 'sinatra/base'
require 'sinatra/reloader'
require './lib/bookmark'

class BookmarkManager < Sinatra::Base
  configure :development do 
    register Sinatra::Reloader
  end

  get '/' do 
     erb(:index)
  end

  get '/bookmarks' do 
    @bookmarks = Bookmark.all
    erb(:bookmarks)
  end

  get '/addbookmarks' do 
    erb(:addbookmarks)
  end 

  post '/bookmarks' do
    Bookmark.create(url: params[:url])
    # The value that is being store is params[:url], the method bove is being passed a hash
    # equivalent to .create(url => wwww.example.com)
    redirect '/bookmarks'
  end

  run! if app_file == $0

end