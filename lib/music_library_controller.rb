class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    my_import = MusicImporter.new(path)
    my_import.import
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
    if user_input == "list songs"
      list_songs
    elsif user_input == "list artists"
      list_artists
    elsif user_input == "list genres"
      list_genres
    elsif user_input == "list artist"
      list_songs_by_artist
    elsif user_input == "list genre"
      list_songs_by_genre
    elsif user_input == "play song"
      play_song
    end
    user_input
    until user_input == 'exit'
      puts "What would you like to do?"
      user_input = gets.strip
    end
  end

  def list_songs
    songs_sorted = Song.all.sort_by{|song| song.name}
    songs_sorted.each_with_index do |song, index|
      puts "#{index.to_i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists_sorted = Artist.all.sort_by{|artist| artist.name}
    artists_sorted.each_with_index do |artist, index|
      puts "#{index.to_i + 1}. #{artist.name}"
    end
  end

  def list_genres
    genres_sorted = Genre.all.sort_by{|genre| genre.name}
    genres_sorted.each_with_index do |genre, index|
      puts "#{index.to_i + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    if my_artist = Artist.find_by_name(user_input)
      songs_sorted = my_artist.songs.sort_by{|song| song.name}
      songs_sorted.each_with_index do |song, index|
        puts "#{index.to_i + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.strip
    if my_genre = Genre.find_by_name(user_input)
      songs_sorted = my_genre.songs.sort_by{|song| song.name}
      songs_sorted.each_with_index do |song, index|
        puts "#{index.to_i + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.strip
    songs_sorted = Song.all.sort_by{|song| song.name}
    my_song = songs_sorted[user_input.to_i - 1]
    my_length = songs_sorted.size
    if user_input.to_i > 0 && user_input.to_i < my_length
      puts "Playing #{my_song.name} by #{my_song.artist.name}"
    end
  end

end
