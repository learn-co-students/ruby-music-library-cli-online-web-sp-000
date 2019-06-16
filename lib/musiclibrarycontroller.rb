require 'pry'
class MusicLibraryController
  attr_accessor :importer
  def initialize(path="./db/mp3s")
    @importer = MusicImporter.new(path)
    importer.import
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
    command = " "
    until command == "exit"
      puts "What would you like to do?"
      command = gets.strip
      case command
       when "list songs"
         list_songs
       when "list artists"
         list_artists
       when "list genres"
         list_genres
       when "play song"
         play_song
       when "list artist"
         list_songs_by_artist
       when "list genre"
         list_songs_by_genre
      end
    end
  end
  def list_songs
    Song.all
     .sort_by { |song| song.name}
     .each_with_index{|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  def list_artists
    Artist.all
    .sort_by { |artist| artist.name}
    .each_with_index{|artist,i| puts "#{i+1}. #{artist.name}"}
  end
  def list_genres
    Genre.all
    .sort_by { |genre| genre.name}
    .each_with_index{|genre,i| puts "#{i+1}. #{genre.name}"}
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.strip
    genre = Genre.find_by_name(genre)
    if genre != nil
      genre.songs.each_with_index{|x,i| puts "#{i+1}. #{x.artist.name} - #{x.name}"}
    end
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.strip
    artist = Artist.find_by_name(artist)
    if artist != nil
      artist.songs
      .sort_by{ |song| song.name}
      .each_with_index{|a,i| puts "#{i+1}. #{a.name} - #{a.genre.name}"}
    end
  end
  def play_song
    puts "Which song number would you like to play?"
    song = gets.strip
    song = song.to_i
    if song >= 1 and song <= Song.all.size
      alpha_songs = Song.all.sort_by{ |song| song.name}
      song = alpha_songs[song - 1]
      if song != nil
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end
end
