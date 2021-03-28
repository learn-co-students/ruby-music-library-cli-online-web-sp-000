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
    @input = nil
    while @input != "exit" do
      @input = gets.strip
      self.send(@input)
    end
  end
  
  # --- CLI METHODS
  def list_songs
    collection = Song.all.sort { |a,b| a.name <=> b.name }
    collection.each_with_index do |song, index|
      puts "#{index.to_i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    
  end
  
  def list_artists
    collection = Artist.all.sort { |a,b| a.name <=> b.name }
    collection.each_with_index do |artist, index|
      puts "#{index.to_i + 1}. #{artist.name}"
    end
  end
  
  def list_genres
    collection = Genre.all.sort { |a,b| a.name <=> b.name }
    collection.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    result = Artist.find_by_name(input)
    
    if result != nil
     collection = result.songs.sort {|a,b| a.name <=>  b.name }
     collection.each_with_index do |song,index|
       puts "#{index.to_i + 1}. #{song.name} - #{song.genre.name}"
     end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    collection = Song.all.select { |song| song.genre.name == input }
    collection.each_with_index do |song, index|
      puts "#{index.to_i + 1}. #{song.artist.name} - #{song.name}"
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    if input.to_i < Song.all.length && input.to_i > 0 
      collection = Song.all.sort { |a,b| a.name <=> b.name }
      selection = collection[input.to_i - 1]
      puts "Playing #{selection.name} by #{selection.artist.name}"
    end
  end
    
end