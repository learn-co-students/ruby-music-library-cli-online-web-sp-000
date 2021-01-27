class MusicLibraryController
  attr_accessor :importer

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    header
    str = gets
    str = str.chomp
    if str == "exit"
      return
    else
      input = str.split(" ")
      main = input[0]
      dir = input[1]

      if main.start_with?("p")
        play_song
      elsif main.start_with?("l")
        case dir
          when "artists"
            list_artists
          when "songs"
            list_songs
          when "genres"
            list_genres
          when "artist"
            list_songs_by_artist
          when "genre"
            list_songs_by_genre
        end
      end
    end
    call
  end

  # sort an array of objs by the name key
  def sort!(arr)
    arr.sort_by(&:name)
  end

  # sort from a classes @all by name key
  def sort(clazz)
    sort!(clazz.all.uniq)
  end

  def play_song
    puts "Which song number would you like to play?"
    str = gets
    str = str.chomp
    i = str.to_i
    if i > 0 && i < Song.all.length
      song = sort(Song)[i - 1]
      puts "Playing #{song.name} by #{song.artist.name}"

    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    str = gets
    str = str.chomp

    artist = Artist.find_by_name(str)
    if artist
      sort!(artist.songs).each_with_index do |song, i|
         puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    str = gets
    str = str.chomp

    genre = Genre.find_by_name(str)
    if genre
      sort!(genre.songs).each_with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def list_artists
    sort(Artist).each_with_index do |artist, i|
       puts "#{i + 1}. #{artist.name}"
     end
  end

  def list_genres
    sort(Genre).each_with_index do |genre, i|
      puts "#{i + 1}. #{genre.name}"
    end
  end

  def list_songs
    sort(Song).each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def prompt
    puts "What would you like to do?"
  end

  def header
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    prompt
  end
end
