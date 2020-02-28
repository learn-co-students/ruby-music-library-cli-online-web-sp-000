class MusicLibraryController
  
  attr_accessor :path, :importer, :artist_names, :genre_names, :full_song_names 
  
  @@all = []
  
  def initialize(path='./db/mp3s')
    @path = path 
    @importer = MusicImporter.new(path).import
    @artist_names = Artist.all.sort{|a,b| a.name<=>b.name}.map{|artist| artist.name}.uniq
    @genre_names = Genre.all.sort{|a,b| a.name<=>b.name}.map{|genre| genre.name}.uniq
    @full_song_names = Song.all.sort{|a,b| a.name<=>b.name}.map{|song| "#{song.artist.name} - #{song.name} - #{song.genre.name}"}.uniq
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
    case input
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
    end
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
    #binding.pry
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
    if genre_names.include?(input)
      songs_by_genre.each{|song| puts "#{songs_by_genre.index(song) + 1}. #{song.gsub(" - #{input}","")}"}
    end 
  end 
  
  def play_song
    #binding.pry
    puts "Which song number would you like to play?"
    input = gets.strip.to_i 
    #binding.pry
    if (1..self.full_song_names.length).include?(input)
      song = Song.all.sort{|a,b| a.name<=>b.name}[input - 1]
      #puts "Playing #{self.full_song_names[input - 1].split(" - ")[1]} by #{self.full_song_names[input - 1].split(" - ")[0]}" 
    end 
    puts "Playing #{song.name} by #{song.artist.name}" if song != nil 
  end 
  
end 