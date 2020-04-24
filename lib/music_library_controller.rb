require 'pry'

class MusicLibraryController
  attr_accessor :path

    def initialize(path="./db/mp3s")
      importer = MusicImporter.new(path)
      importer.import
    end

    def call
      input = ""
      while input != "exit"
        puts("Welcome to your music library!")
        puts("To list all of your songs, enter 'list songs'.")
        puts("To list all of the artists in your library, enter 'list artists'.")
        puts("To list all of the genres in your library, enter 'list genres'.")
        puts("To list all of the songs by a particular artist, enter 'list artist'.")
        puts("To list all of the songs of a particular genre, enter 'list genre'.")
        puts("To play a song, enter 'play song'.")
        puts("To quit, type 'exit'.")
        puts("What would you like to do?")
        input = gets.strip
        if input == "list songs"
          list_songs
        elsif input == "list artists"
          list_artists
        elsif input == "list genres"
          list_genres
        elsif input == "list artist"
          list_songs_by_artist
        elsif input == "list genre"
          list_songs_by_genre
        elsif input == "play song"
          play_song
        end
      end
    end

    def list_songs
      songs = Song.alphabetical
      songs.each_with_index do |song, index|
        puts("#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}")
      end
    end

    def list_artists
      artists = Artist.alphabetical
      artists.each_with_index do |artist, index|
        puts("#{index+1}. #{artist.name}")
      end
    end

    def list_genres
      genres = Genre.alphabetical
      genres.each_with_index do |genres, index|
        puts("#{index+1}. #{genres.name}")
      end
    end

    def list_songs_by_artist
      puts("Please enter the name of an artist:")
      input = gets.strip
      found_artist = Artist.find_by_name(input)
      if (found_artist != nil)
        found_songs = found_artist.songs_select
        found_sorted_songs = found_songs.sort_by {|song| song.name}
        found_sorted_songs.each_with_index do |song, index|
          puts("#{index+1}. #{song.name} - #{song.genre.name}")
        end
      end
    end

    def list_songs_by_genre
      puts("Please enter the name of a genre:")
      input = gets.strip
      found_genre = Genre.find_by_name(input)
      if (found_genre != nil)
        found_songs = found_genre.songs
        found_sorted_songs = found_songs.sort_by {|song| song.name}
        found_sorted_songs.each_with_index do |song, index|
          puts("#{index+1}. #{song.artist.name} - #{song.name}")
        end
      end
    end

    def play_song
      puts("Which song number would you like to play?")
      input = gets.strip
      input_int = input.to_i
      songs = Song.alphabetical
      if (input_int > 0) && (input_int < (songs.length+1))
         selected_song = songs[input_int-1]
         puts("Playing #{selected_song.name} by #{selected_song.artist.name}")
      end
    end
end
