require "pry"

class MusicLibraryController
  attr_accessor :path, :name

  extend Concerns::Findable

  def initialize(path = './db/mp3s')
    @path = path
    file = MusicImporter.new(path)
    file.import
  end

  def call
    input = ""

    until input == "exit"
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
    Song.all.sort {|a, b| a.name <=> b.name}.uniq.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  #  binding.pry
  end

  def list_artists
    Artist.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort{|a, b| a.name <=> b.name}.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end

  def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets.chomp
      if artist = Artist.find_by_name(input)
        songs_sorted_by_name = artist.songs.sort_by do |song|
        song.name
        end
        songs_sorted_by_name.each.with_index(1) do |song, i|
          puts "#{i}. #{song.name} - #{song.genre.name}"
        end
      end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.chomp
        if genre = Genre.find_by_name(input)
          songs_sorted_by_name = genre.songs.sort_by do |song|
            song.name
        end
          songs_sorted_by_name.each.with_index(1) do |song, i|
            puts "#{i}. #{song.artist.name} - #{song.name}"
        end
      end
    end

    def play_song
      input = ""
      choice = []

      puts "Which song number would you like to play?"
      input = gets.chomp.to_i
      valid_input = input > 0 && (input <= Song.all.length)

      if valid_input == true
        choice = []
        Song.all.sort {|a, b| a.name <=> b.name}.each do |song|
          choice << "Playing #{song.name} by #{song.artist.name}"
        end
        puts choice[input - 1]
      end
    end
end
