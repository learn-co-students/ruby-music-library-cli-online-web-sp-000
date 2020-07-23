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
  
  case input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when "list genres"
        list_genres
      when "list artist"
        list_songs_by_artist
      when "list genre"
        list_songs_by_genre
      when "play song"
        play_song
      end
      end
      end

  
  
  def list_songs
  sort_by_name = Song.all.uniq.sort_by{|song| song.name} 
  sort_by_name.each_with_index do |song, index| 
   puts  "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
   end
end

  def list_artists
    sort_by_artist = Artist.all.sort_by {|artist| artist.name}
    
    artists = sort_by_artist.collect{|artist| artist.name}.uniq
    
    artists.each_with_index do |artist, index| 
   puts "#{index+1}. #{artist}"
   end
 end
 
 def list_genres
     sort_by_genre = Genre.all.sort_by {|genre| genre.name}
    genres = sort_by_genre.collect{|genre| genre.name}.uniq
    genres.each_with_index do |genre, index| 
   puts "#{index+1}. #{genre}"
   end
 end
 
def list_songs_by_artist
  puts "Please enter the name of an artist:"
  input = gets.strip 
  artists_songs = Song.all.select {|song| song.artist.name == input}
  sorted_artists_songs = artists_songs.sort_by{|song| song.name}.uniq
  sorted_artists_songs.each_with_index do |song, index|
    puts "#{index+1}. #{song.name} - #{song.genre.name}"
    end
end

def list_songs_by_genre
   puts "Please enter the name of a genre:"
  input = gets.strip 
  genre_songs = Song.all.select {|song| song.genre.name == input}
  sorted_genre_songs = genre_songs.sort_by{|song| song.name}.uniq
  sorted_genre_songs.each_with_index do |song, index|
    puts "#{index+1}. #{song.artist.name} - #{song.name}"
    end
end

def play_song
 puts  "Which song number would you like to play?"
 input = gets.strip
 if input.to_i >= 1 && input.to_i <= Song.all.uniq.length
 chosen_song = Song.all.uniq.sort_by{|song| song.name}[input.to_i - 1]
puts "Playing #{chosen_song.name} by #{chosen_song.artist.name}"
  else
  end
end

end