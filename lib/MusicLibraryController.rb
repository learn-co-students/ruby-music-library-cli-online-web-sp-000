require 'pry'
class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
  end

  def call
    #binding.pry
    user_input = ""
    while user_input != "exit"
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
    case user_input
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
    Song.sort_songs
  end

  def list_artists
    Artist.sort_artists
  end

  def list_genres
    Genre.sort_genres
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip #=> This is the artist name!!!

    if artist = Artist.find_by_name(user_input)
      # binding.pry
      artist_array = artist.songs.sort {|a,b| a.name <=> b.name }
      # binding.pry
      artist_array.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    # binding.pry
    # returns a sorted list of all songs from the inputed artist name.
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip #=> This is the artist name!!!

    if genre = Genre.find_by_name(user_input)
      # binding.pry
      genre_array = genre.songs.sort {|a,b| a.name <=> b.name }
      # binding.pry
      genre_array.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    # binding.pry
    # returns a sorted list of all songs from the inputed artist name.
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip
    song_array = Song.all.uniq.sort_by {|i| i.name}
    song_array.each_with_index do |song, index|
      if user_input.to_i-1 == index
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end

  end

end
