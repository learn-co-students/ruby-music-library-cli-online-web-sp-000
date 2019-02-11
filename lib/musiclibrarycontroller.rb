class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    music_importer = MusicImporter.new(path)
    music_importer.import

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

      operation = gets
      
      while operation != "exit"
        case operation
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
          operation = gets
      end
  end

  def list_songs
    i = 1
    Song.all.sort_by(&:name).each {|song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i += 1
    }
    end

  def list_artists
    i = 1
    Artist.all.sort_by(&:name).each {|artist|
      puts "#{i}. #{artist.name}"
      i += 1
    }
  end

  def list_genres
    i = 1
    Genre.all.sort_by(&:name).each {|genre|
      puts "#{i}. #{genre.name}"
      i += 1
    }

  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_input = gets
    artist = Artist.find_by_name(artist_input)
    if !artist.nil?
      i = 1
      artist.songs.sort_by(&:name).each {|song|
        puts "#{i}. #{song.name} - #{song.genre.name}"
        i += 1
      }
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_input = gets
    genre = Genre.find_by_name(genre_input)
    if !genre.nil?
      i = 1
      genre.songs.sort_by(&:name).each {|song|
        puts "#{i}. #{song.artist.name} - #{song.name}"
        i += 1
      }
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.to_i
    if song_number > 0 && song_number < Song.all.size
      song = Song.all.sort_by(&:name)[song_number-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
