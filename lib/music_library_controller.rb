class MusicLibraryController
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
    @@song_list = sort_by_name(Song.all)
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
    loop do
      input = gets.strip
      case input
      when "list songs" then list_songs
      when "list artists" then list_artists
      when "list genres" then list_genres
      when "list artist" then list_songs_by_artist
      when "list genre" then list_songs_by_genre
      when "play song" then play_song
      end
      break if input == "exit"
    end
  end

  def sort_by_name(array)
    array.sort { |item1, item2| item1.name <=> item2.name }
  end

  def list_songs
    @@song_list.each_with_index do |song, i|
      puts "#{i+ 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sort_by_name(Artist.all).each_with_index do |artist, i|
      puts "#{i+ 1}. #{artist.name}"
    end
  end

  def list_genres
    sort_by_name(Genre.all).each_with_index do |genre, i|
      puts "#{i+ 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
    if artist
      sort_by_name(artist.songs).each_with_index do |song, i|
        puts "#{i+ 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
    if genre
      sort_by_name(genre.songs).each_with_index do |song, i|
        puts "#{i+ 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    index = input.to_i - 1
    if index && index.between?(0, @@song_list.length - 1)
      song = @@song_list[index]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
