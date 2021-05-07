require "pry"
class MusicLibraryController 
  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import 
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
    input = gets.chomp
    if input == "list songs"
      self.list_songs
    elsif input == "list artists"
      self.list_artists
    elsif input == "list genres"
      self.list_genres
    elsif input == "list artist"
      self.list_songs_by_artist
    elsif input == "list genre"
      self.list_songs_by_genre 
    elsif input == "play song"
      self.play_song
    elsif input == "exit"
    else 
      self.call 
    end 
  end 
  
  def list_songs
    sorted_songs = Song.all.sort {|a,b| a.name<=>b.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end 
  end 
  
  def list_artists
    sorted_artists = Artist.all.sort {|a,b| a.name<=>b.name}
    sorted_artists.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end 
  
  def list_genres
    sorted_genres = Genre.all.sort {|a,b| a.name<=>b.name}
    sorted_genres.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end 
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp 
    if Artist.find_by_name(input) == nil
      nil
    else 
      artist = Artist.find_by_name(input)
      sorted_songs = artist.songs.sort {|a,b| a.name <=> b.name}
      sorted_songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end 
    end 
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp 
    if Genre.find_by_name(input) == nil
      nil
    else 
      genre = Genre.find_by_name(input)
      sorted_songs = genre.songs.sort {|a,b| a.name <=> b.name}
      sorted_songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end 
    end 
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp 
    if input.to_i > 0 && input.to_i <= Song.all.count
      selection = nil 
      Song.all.sort {|a,b| a.name<=>b.name}.each_with_index do |song, index|
        if index+1 == input.to_i
          selection = song 
          puts "Playing #{selection.name} by #{selection.artist.name}"
        end 
      end 
    end 
  end
  
  
end 