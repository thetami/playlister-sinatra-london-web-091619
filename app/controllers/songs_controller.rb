class SongsController < ApplicationController

    get '/songs' do
        @songs = Song.all
        erb :'/songs/index'
    end

    get "/songs/new" do
      erb :"/songs/new"
    end

    get '/songs/:slug' do
        @song = Song.find_by_slug(params[:slug])
        erb :'/songs/show'
    end

    post "/songs" do

      name = params[:name]
      artist_name = params[:artist_name]
      artist =
        Artist.find_by(name: artist_name) || Artist.create(name: artist_name)
      @song = Song.create(name: name, artist: artist)

      redirect "/songs/#{@song.slug}"
    end
end
