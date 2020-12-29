require 'pry'

class MusicLibraryController
  attr_accessor :library, :input
  def initialize(path = "./db/mp3s")
    @library = MusicImporter.new(path).import
  end

  def call

# Welcome the user
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"

# get input from user
# binding.pry
    @input = gets.chomp

# loop back until user types in 'exit'
    # input != "exit" ? call : return

    if @input != "exit"
      action
      call
    else
      return
    end
  end


  def action
  # trigger output from the user input
  # binding.pry
      if @input == "list songs"
         list_songs
      elsif @input == "list artists"
         list_artists
      elsif @input == "list genres"
         list_genres
      elsif @input == "list artist"
         list_songs_by_artist
      elsif @input == "list genre"
         list_songs_by_genre
      elsif @input == "play song"
         play_song
      end
  end



  def sort_songs
    Song.all.sort_by {|obj| obj.name}
  end

  def list_songs
    songs_sorted = sort_songs

    songs_sorted.each_with_index do |song, index|
      num = index + 1
      name = song.name
      artist = song.artist.name
      genre = song.genre.name
      puts "#{num}. #{artist} - #{name} - #{genre}"
      # binding.pry
    end
  end

  def list_artists
    artists = Artist.all.sort_by {|obj| obj.name}
    artists.each_with_index do |artist, index|
      num = index + 1
      artist = artist.name
      puts "#{num}. #{artist}"
    end
  end

  def list_genres
    genres = Genre.all.sort_by {|obj| obj.name}
    genres.each_with_index do |genre, index|
      num = index + 1
      genre = genre.name
      puts "#{num}. #{genre}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.find_by_name(input)

    if artist != nil
      songs = artist.songs.sort_by {|obj| obj.name}
      songs.each_with_index do |song, index|
        num = index + 1
        name = song.name
        genre = song.genre.name
        puts "#{num}. #{name} - #{genre}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.find_by_name(input)

    if genre != nil
      songs = genre.songs.sort_by {|obj| obj.name}
      songs.each_with_index do |song, index|
        num = index + 1
        name = song.name
        artist = song.artist.name
        puts "#{num}. #{artist} - #{name}"
      end
    end
  end

  def play_song
    song_list = sort_songs

    puts "Which song number would you like to play?"
    user_selection = gets.chomp.to_i
    selection_index = user_selection - 1

    if selection_index.between?(0, song_list.size-1)
      puts "Playing #{song_list[selection_index].name} by #{song_list[selection_index].artist.name}"
    end
  end

end
