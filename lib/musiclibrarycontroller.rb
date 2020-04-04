class MusicLibraryController

  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    musicimporter = MusicImporter.new(path)
    musicimporter.import
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

    user_input = gets.chomp

    while user_input != "exit"
      case user_input
      when "list songs"
        list_songs
      when "list artists"
        list_artists
      when " list genres"
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
    Song.all.sort_by {|song| song.name}.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    Artist.all.sort_by {|artist| artist.name}.each_with_index {|artist, i| puts "#{i+1}. #{artist.name}"}
  end

  def list_genres
    Genres.all.sort_by {|genre| genre.name}.each_with_index {|genre, i| puts "#{i+1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    artist = Artist.all.detect {|artist| artist.name == input}
    artist.songs.each_with_index {|song, i| puts "#{i+1}. #{song.name}"} if artist
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    genre = Genre.all.detect {|genre| genre.name == input}
    genre.songs.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name}"} if genre
  end

  def play_song
    puts "Which song number would you like to play?"
    list_songs
    input = gets.chomp.to_i
    songs = Song.all.sort_by {|song| song.name}
    valid = (input >= 1 && input <= songs.length)
    song = songs.detect {|song| songs.index(song) == input - 1}
    puts "Playing #{song.name} by #{song.artist.name}" if song && valid
  end


end
