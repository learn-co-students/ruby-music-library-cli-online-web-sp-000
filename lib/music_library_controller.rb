require 'pry'
class MusicLibraryController
  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
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

    user_input = gets.strip

    until user_input == "exit"
      if user_input == 'list songs'
        list_songs
      end
      if user_input == 'list artists'
        list_artists
      end
      if user_input == 'list genres'
        list_genres
      end
      if user_input == 'list artist'
        list_songs_by_artist
      end
      if user_input == 'list genre'
        list_songs_by_genre
      end
      if user_input == 'play song'
        play_song
      end
      user_input = gets.strip
    end
  end

    def list_songs
      Song.all.sort_by {|song| song.name}.each_with_index do |song, index|
        puts "#{index + 1}" + ". " + song.artist.name + " - " + song.name + " - " + song.genre.name
      end
    end

    def list_artists
      Artist.all.sort_by {|artist| artist.name}.uniq.each_with_index do |artist, index|
        puts "#{index + 1}" + ". " + artist.name
      end
    end

    def list_genres
      Genre.all.sort_by {|genre| genre.name}.uniq.each_with_index do |genre, index|
        puts "#{index + 1}" + ". " + genre.name
      end
    end

    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      user_artist = gets.strip
      artist = Artist.find_by_name(user_artist)
      if artist != nil
        artist.songs.sort_by {|song| song.name}.uniq.each_with_index do |song, index|
          puts "#{index + 1}" + ". " + song.name + " - " + song.genre.name
        end
      end
    end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      user_genre = gets.strip
      genre = Genre.find_by_name(user_genre)
      if genre != nil
        genre.songs.sort_by {|song| song.name}.uniq.each_with_index do |song, index|
          puts "#{index + 1}" + ". " + song.artist.name + " - " + song.name
        end
      end
    end

    def play_song
      puts "Which song number would you like to play?"
      song_number = gets.strip.to_i
      if song_number.between?(1, Song.all.length)
        play_song = Song.all.sort_by {|song| song.name}[song_number - 1]
        puts "Playing " + play_song.name + " by " + play_song.artist.name
      end
    end

end
