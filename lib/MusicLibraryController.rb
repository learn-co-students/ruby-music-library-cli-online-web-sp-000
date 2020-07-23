class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    @path = path
    new_instance = MusicImporter.new(@path)
    new_instance.import
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
    response = ""
    while response != "exit"
      response = gets.strip
      if response == 'list songs'
        list_songs()
      elsif response == 'list artists'
        list_artists()
      elsif response == 'list genres'
        list_genres()
      elsif response == 'list artist'
        list_songs_by_artist()
      elsif response == 'list genre'
        list_songs_by_genre()
      elsif response == 'play song'
        play_song()
      end
    end
  end

  def list_songs
    songs = Song.all
    songs = songs.sort_by {|song| song.name}
    songs.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists = Artist.all
    artists = artists.sort_by {|artist| artist.name}
    artists.each_with_index do |artist, i|
      puts "#{i + 1}. #{artist.name}"
    end
  end

  def list_genres
    genres = Genre.all
    genres = genres.sort_by {|genre| genre.name}
    genres.each_with_index do |genre, i|
      puts "#{i + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    response = gets.strip
    artist = Artist.find_by_name(response)
    if artist != nil
      songs = artist.songs
      songs = songs.sort_by {|song| song.name}
      songs.each_with_index do |song, i|
        puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    response = gets.strip
    genre = Genre.find_by_name(response)
    if genre != nil
      songs = genre.songs
      songs = songs.sort_by {|song| song.name}
      songs.each_with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    response = gets.strip
    response = response.to_i - 1
    songs = Song.all
    songs = songs.sort_by {|song| song.name}
    songs.each_with_index do |song, i|
      if i == response
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
  end

end
