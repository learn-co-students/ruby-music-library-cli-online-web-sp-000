require "pry"

class MusicLibraryController
  
  attr_accessor :path 
  
  def initialize(path = "./db/mp3s")
      @path = path
      new = MusicImporter.new(path)
      new.import
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
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
    end
    
    until input == "exit"
      puts "What would you like to do?"
      input = gets.strip
    end
    
  end
  
  
  
  def list_songs
    song_array = Song.all.collect {|s| s}
    
    song_array = song_array.uniq
    sorted_array = song_array.sort_by{|s| s.name}
    
    sorted_array.each_with_index do |s, i|
    puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end
  
  def list_artists
    artist_array = Artist.all.collect {|a| a}
    
    artist_array = artist_array.uniq
    sorted_array = artist_array.sort_by{|a| a.name}
    
    sorted_array.each_with_index do |a, i|
      puts "#{i+1}. #{a.name}"
    end
  end
  
  def list_genres
    genre_array = Genre.all.collect{|g| g}
    
    genre_array = genre_array.uniq
    sorted_array = genre_array.sort_by{|g| g.name}
    
    sorted_array.each_with_index do |g, i|
      puts "#{i+1}. #{g.name}"
    end
  end
  
  
  def list_songs_by_artist 
    puts "Please enter the name of an artist:"
    
    input = gets.strip
    
    x = Artist.find_by_name(input)
    
    if x != nil
      sorted_array = x.songs.sort_by{|s| s.name}
      sorted_array.each_with_index do |s, i|
        puts "#{i+1}. #{s.name} - #{s.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    
    input = gets.strip
    
    x = Genre.find_by_name(input)
    
    if x != nil
      sorted_array = x.songs.sort_by{|s| s.name}
      sorted_array.each_with_index do |s, i|
        puts "#{i+1}. #{s.artist.name} - #{s.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    
    input = gets.strip.to_i
    
    song_array = Song.all.collect {|s| s}
    
    song_array = song_array.uniq
    sorted_array = song_array.sort_by{|s| s.name}
    
    if input > 0 && input <= sorted_array.length
      puts "Playing #{sorted_array[input-1].name} by #{sorted_array[input-1].artist.name}"
    end
  end
  
end