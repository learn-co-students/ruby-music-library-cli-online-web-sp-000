class MusicLibraryController
  extend Concerns::Findable
  require "pry"

def initialize(path = './db/mp3s')
  new_importer = MusicImporter.new(path)
  new_importer.import
end

def call
puts "Welcome to your music library!"
input = ""
until input == "exit"
puts "To list all of your songs, enter 'list songs'."
puts "To list all of the artists in your library, enter 'list artists'."
puts "To list all of the genres in your library, enter 'list genres'."
puts "To list all of the songs by a particular artist, enter 'list artist'."
puts "To list all of the songs of a particular genre, enter 'list genre'."
puts "To play a song, enter 'play song'."
puts "To quit, type 'exit'."
puts "What would you like to do?"
input = gets.strip
if input == "list songs"
  list_songs
elsif input == "list artists"
  list_artists
elsif input == "list genres"
  list_genres
elsif input == "list artist"
  list_songs_by_artist
elsif input == "list genre"
  list_songs_by_genre
elsif input == "play song"
  play_song
end
end
end

def list_songs
i = 1
Song.all.sort_by(&:name).each do |song|
    puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    i += 1
end
end

def list_artists
i = 1
Artist.all.sort_by{|artist| artist.name}.each do |artist|
    puts "#{i}. #{artist.name}"
    i += 1
end
end

def list_genres
i = 1
Genre.all.sort_by{|genre| genre.name}.each do |genre|
    puts "#{i}. #{genre.name}"
  i += 1
end
end

def list_songs_by_artist
puts "Please enter the name of an artist:"
input = gets.strip
found = Artist.find_by_name(input)
if found != ""
  i = 0
  found.songs.sort_by{|s| s.name}.collect {|s| puts "#{i+=1}. #{s.name} - #{s.genre.name}"}
end
end

def list_songs_by_genre
puts "Please enter the name of a genre:"
input = gets.strip
found = Genre.find_by_name(input)
if found != ""
  i = 0
  found.songs.sort_by{|s| s.name}.collect {|s| puts "#{i+=1}. #{s.artist.name} - #{s.name}"}
end
end

def play_song
puts "Which song number would you like to play?"
number = gets.strip
number = number.to_i

if number >0 && number < Song.all.count
  element = Song.all.sort_by(&:name)[number-1]
  puts "Playing #{element.name} by #{element.artist.name}"
end
end

end
