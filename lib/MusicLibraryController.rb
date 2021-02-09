class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import()
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
    until user_input == "exit"
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
      user_input = gets.chomp
    end
  end

  def get_songs
    Song.all.sort { |a, b| a.name <=> b.name }
  end

  def list_songs
    get_songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    ordered_artists = Artist.all.sort { |a, b| a.name <=> b.name }
    ordered_artists.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end

  def list_genres
    ordered_genres = Genre.all.sort { |a, b| a.name <=> b.name }
    ordered_genres.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    identified_artist = Artist.find_by_name(user_input)
    if identified_artist.nil? == false
      artist_songs = identified_artist.songs.sort { |a, b| a.name <=> b.name }
      artist_songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    identified_genre = Genre.find_by_name(user_input)
    if identified_genre.nil? == false
      genre_songs = identified_genre.songs.sort { |a, b| a.name <=> b.name }
      genre_songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp.to_i
    songs = get_songs
    if user_input > 1 && user_input < songs.length
      correct_song = songs[user_input - 1]
      puts "Playing #{correct_song.name} by #{correct_song.artist.name}"
    end
  end
end
