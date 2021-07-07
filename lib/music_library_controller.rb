class MusicLibraryController

  attr_reader :path
  attr_accessor :songs_sorted

  def initialize(path='./db/mp3s')
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

    input = gets.chomp
    while input != 'exit'
      if input == 'list songs'
        list_songs
      elsif input == 'list artists'
        list_artists
      elsif input == 'list genres'
        list_genres
      elsif input == 'list artist'
        list_songs_by_artist
      elsif input == 'list genre'
        list_songs_by_genre
      elsif input == 'play song'
        play_song
      end
      input = gets.chomp
    end

  end

  def list_songs
    songs_sorted = Song.all.sort_by {|song| song.name}
    songs_sorted.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists_sorted = Artist.all.sort_by {|artist| artist.name}
    artists_sorted.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    genres_sorted = Genre.all.sort_by {|genre| genre.name}
    genres_sorted.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets.chomp
    list_of_songs = Artist.find_or_create_by_name(artist_input).songs
    sorted_songs = list_of_songs.sort_by {|s| s.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets.chomp
    list_of_songs = Genre.find_or_create_by_name(genre_input).songs
    sorted_songs = list_of_songs.sort_by {|s| s.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_index = gets.chomp.to_i - 1
    songs = Song.all.sort_by {|song| song.name}
    if (0...(songs.size)).include? song_index
      song = songs[song_index]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
