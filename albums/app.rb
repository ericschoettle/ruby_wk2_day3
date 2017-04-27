require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('./lib/album')
require('./lib/artist')
require('pry')


get ("/") do
  erb(:index)
end

get ("/artists") do
  @artists = Artist.all()
  erb(:artists)
end

get ("/albums") do
  @albums = Album.all()
  erb(:albums)
end

post ("/artists") do
  artist = params[:artist]
  artist = Artist.new(artist)
  artist.save()
  @artists = Artist.all()
  erb(:artists)
end

post ("/albums") do
  name = params[:name]
  year = params[:year]
  album = Album.new(name, year)
  album.save()
  @albums = Album.all()
  erb(:albums)
end

get ("/artist/:id") do
  @artist = Artist.find(params[:id].to_i)
  @albums = Album.all()
  erb(:artist)
end

get ("/album/:id") do
  @album = Album.find(params[:id].to_i)
  @artists = Artist.all()
  erb(:album)
end

get ("/artist/:artist_id/:album_id") do
  @artist = Artist.find(params[:artist_id].to_i)
  @album = Album.find(params[:album_id].to_i)
  @artist.add_album(@album)
  @artists = Artist.all()
  erb(:artists)
end

post ("/artist/:artist_id/:album_id") do
  @artist = Artist.find(params[:artist_id].to_i)
  @album = Album.find(params[:album_id].to_i)
  name = params[:name]
  year = params[:year]
  album = Album.new(name, year)
  album.save()
  @artist.add_album(album)
  @artists = Artist.all()
  erb(:artists)
end
