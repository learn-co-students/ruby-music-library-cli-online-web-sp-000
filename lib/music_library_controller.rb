class MusicLibraryController
  
  attr_accessor :path, :importer, :artist_names, :genre_names, :full_song_names 
  
  @@all = []
  
  def initialize(path='./db/mp3s')
    @path = path 
    @importer = MusicImporter.new(path).import
    @artist_names = MusicImporter.new(path).files.map{|file| file.split(" - ")[0]}.uniq.sort 
    @genre_names = MusicImporter.new(path).files.map{|file| file.split(" - ")[2].gsub(".mp3","")}.uniq.sort 
    @full_song_names = MusicImporter.new(path).files.map{|file| file.gsub(".mp3","")}.uniq.sort{|a,b| a.split(" - ")[1]<=>b.split(" - ")[1]} 
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
    self.full_song_names.each{|song| puts "#{full_song_names.index(song) + 1}. #{song}"}
  end 
  #binding.pry
  def list_artists
    binding.pry
    self.artist_names.each{|artist| puts "#{artist_names.index(artist) + 1}. #{artist}"}
  end 
  
  def list_genres
    self.genre_names.each{|genre| puts "#{genre_names.index(genre) + 1}. #{genre}"}
  end 
  
  def list_songs_by_artist
    #binding.pry
    puts "Please enter the name of an artist:"
    input = gets.strip
    songs_by_artist = self.full_song_names.filter{|song| song.split(" - ")[0] == input}
    if artist_names.include?(input)
      songs_by_artist.each{|song| puts "#{songs_by_artist.index(song) + 1}. #{song.gsub("#{input} - ","")}"} 
    end 
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    songs_by_genre = self.full_song_names.filter{|song| song.split(" - ")[2] == input}
    if artist_names.include?(input)
      songs_by_genre.each{|song| puts "#{songs_by_genre.index(song) + 1}. #{song.gsub("#{input} - ","")}"}
    end 
  end 
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    if [1...full_song_names.length].include?(input.to_i) 
      puts "Playing #{full_song_names[input.to_i - 1].split(" - ")[1]} by #{full_song_names[input.to_i - 1].split(" - ")[0]}"
    end 
  end 
  
end 