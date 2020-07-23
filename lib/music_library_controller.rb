require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end

  def call
    input = gets
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    if input == 'list songs'
      list_songs
    end
    puts "To list all of the artists in your library, enter 'list artists'."
    if input == 'list artists'
      list_artists
    end
    puts "To list all of the genres in your library, enter 'list genres'."
    if input == 'list genres'
      list_genres
    end
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    if input == 'list artist'
      list_songs_by_artist
    end
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    if input == 'list genre'
      list_songs_by_genre
    end
    puts "To play a song, enter 'play song'."
    if input == 'play song'
      play_song
    end
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    unless input == 'exit'
      call
    end
  end

    def list_songs
      Song.all.sort_by!{|song| song.name}.each_with_index {|song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      }
    end

    def list_artists
      Artist.all_sorted.each_with_index {|artist, index|
        puts "#{index + 1}. #{artist.name}"
      }
    end

    def list_genres
      Genre.all_sorted.each_with_index {|genre, index|
        puts "#{index + 1}. #{genre.name}"
      }
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      input = gets
      Song.all_sorted.select{|song| song.artist.name == input}.each_with_index {|song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      }
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      input = gets
      Song.all_sorted.select{|song| song.genre.name == input}.each_with_index {|song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      }
    end

    def play_song
      puts "Which song number would you like to play?"
      input = gets.to_i - 1
      if input > 1 && input < Song.all_sorted.length
        selection = Song.all_sorted[input]
      end
      return if selection == nil
      puts "Playing #{selection.name} by #{selection.artist.name}"
    end

end
