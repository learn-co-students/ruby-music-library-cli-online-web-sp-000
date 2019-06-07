require "pry"

class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    input = gets

    while input != "exit"
      input = gets
    end
  
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end
  
  def list_songs
    number = 0
    array = Song.all.sort_by(&:name)  # sorts @@all songs by name

    array.each do |song|
    number += 1
    puts "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end  
  end
  
  def list_artists
    number = 0
    array = Artist.all.sort_by(&:name) 

    array.each do |song|
    number += 1
    puts "#{number}. #{song.name}"
    end      
  end
  
  def list_genres
    number = 0
    array = Genre.all.sort_by(&:name) 

    array.each do |song|
    number += 1
    puts "#{number}. #{song.name}"
    end      
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    
    if artist = Artist.find_by_name(input)
    
    artist.songs.sort_by(&:name).each.with_index(1) do |song,index|

    puts "#{index}. #{song.name} - #{song.genre.name}"
      end
    end
  end
end

=begin





    array.each.with_index(1) do |song,index|

    it "prints all songs by a particular artist in a numbered list (alphabetized by song name)" do
      Song.create_from_filename("Real Estate - Wonder Years - dream pop.mp3")

      allow(music_library_controller).to receive(:gets).and_return("Real Estate")

      expect($stdout).to receive(:puts).with("Please enter the name of an artist:")
      expect($stdout).to receive(:puts).with("1. Green Aisles - country")
      expect($stdout).to receive(:puts).with("2. It's Real - hip-hop")
      expect($stdout).to receive(:puts).with("3. Wonder Years - dream pop")

      music_library_controller.list_songs_by_artist
    end

Failures:

  1) MusicLibraryController - CLI Methods #list_songs_by_artist prints all songs by a particular artist in a numbered list (alphabetized by song name)
     Failure/Error: expect($stdout).to receive(:puts).with("1. Green Aisles - country")

       (#<IO:<STDOUT>>).puts("1. Green Aisles - country")
           expected: 1 time with arguments: ("1. Green Aisles - country") real estate
           received: 0 times

=end
