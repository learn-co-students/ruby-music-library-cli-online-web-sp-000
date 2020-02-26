class MusicLibraryController
  
  attr_accessor :path, :importer, :artist_names, :genre_names, :full_song_names 
  
  @@all = []
  
  def initialize(path='./db/mp3s')
    @path = path 
    @importer = MusicImporter.new(path).import
    @artist_names = MusicImporter.new(path).files.map{|file| file.split(" - ")[0]}.uniq 
    @genre_names = MusicImporter.new(path).files.map{|file| file.split(" - ")[2].gsub(".mp3","")}.uniq 
    @full_song_names = MusicImporter.new(path).files.map{|file| file.gsub(".mp3","")}.uniq 
    @@all << self 
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip
    until input == 'exit' do 
      puts "What would you like to do?"
      input = gets.strip
    end 
  end 
  
  def list_songs
    array = self.full_song_names.sort{|a,b| a.split(" - ")[1]<=>b.split(" - ")[1]}
    array.each{|song| puts "#{array.index(song) + 1}. #{song}"}
  end 
  #binding.pry
  def list_artists
    #binding.pry
    array = self.artist_names.sort
    array.each{|artist| puts "#{array.index(artist) + 1}. #{artist}"}
  end 
  
  def list_genres
    array = self.genre_names.sort
    array.each{|genre| puts "#{array.index(genre) + 1}. #{genre}"}
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    array = self.full_song_names.sort{|a,b| a.split(" - ")[1]<=>b.split(" - ")[1]}
    songs_by_artist = array.filter{|song| song.split(" - ")[0] == input}
    songs_by_artist.each{|song| puts "#{songs_by_artist.index(song) + 1}. #{song.gsub("#{input} - ","")}"}
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    array = self.full_song_names.sort{|a,b| a.split(" - ")[1]<=>b.split(" - ")[1]}
    songs_by_genre = array.filter{|song| song.split(" - ")[2] == input}
    songs_by_genre.each{|song| puts "#{songs_by_genre.index(song) + 1}. #{song.gsub("#{input} - ","")}"}
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets
  end 
  
end 