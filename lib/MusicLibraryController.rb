require "pry"
class MusicLibraryController
  attr_accessor :path
  
  def initialize(path = './db/mp3s')
    @path = path
    new_mi = MusicImporter.new(path)
    new_mi.import
  end
  
  def call 
    input = ""
    until input == "exit" do
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.chomp
  end
  end
  
  
  def list_songs
  sort_by_name = Song.all.uniq.sort_by{|song| song.name} 
  sort_by_name.each_with_index do |song, index| 
   puts  "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
   end
end

  def list_artists
    sort_by_artist = Song.all.sort_by {|song| song.artist.name}
    artists = sort_by_artist.collect {|song| song.artist.name}.uniq
    artists.each_with_index do |artist, index| 
   puts "#{index+1}. #{artist}"
 end
end
  

  
end