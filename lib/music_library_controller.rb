class MusicLibraryController
  
  def initialize(path = './db/mp3s')
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
    command = ""
    while command != "exit"
      puts "What would you like to do?"
      if command == 'list songs'
        list_songs
      elsif command == 'list artists'
        list_artists
      elsif command == 'list genres'
        list_genres
      elsif command == 'list artist'
        list_songs_by_artist
      elsif command == 'list genre'
        list_songs_by_genre
      elsif command == 'play song'
        play_song
      end
      command = gets
    end
  end
  
  def list_songs
    song_count = 0
    Song.all.sort { |song_a, song_b| 
      song_a.name <=> song_b.name
    }.each { |song|
      song_count += 1
      puts "#{song_count}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
    }
  end
  
  def list_artists
    artist_count = 0
    Artist.all.sort { |artist_a, artist_b| 
      artist_a.name <=> artist_b.name
    }.each { |artist|
      artist_count += 1
      puts "#{artist_count}. #{artist.name}"
    }
  end
  
  def list_genres
    genre_count = 0
    Genre.all.sort { |genre_a, genre_b| 
      genre_a.name <=> genre_b.name
    }.each { |genre|
      genre_count += 1
      puts "#{genre_count}. #{genre.name}"
    }
  end
  
  def list_songs_by_artist
    song_count = 0
    puts "Please enter the name of an artist:"
    artist_name = gets
    artist = Artist.find_by_name(artist_name)
    artist.songs.sort { |song_a, song_b| 
      song_a.name <=> song_b.name
    }.each { |song|
      song_count += 1
      puts "#{song_count}. #{song.name} - #{song.genre.name}" 
    } unless artist == nil
  end
  
  def list_songs_by_genre
    song_count = 0
    puts "Please enter the name of a genre:"
    genre_name = gets
    genre = Genre.find_by_name(genre_name)
    genre.songs.sort { |song_a, song_b| 
      song_a.name <=> song_b.name
    }.each { |song|
      song_count += 1
      puts "#{song_count}. #{song.artist.name} - #{song.name}" 
    } unless genre == nil
  end
  
  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.to_i
    if song_number > 0 && song_number < Song.all.count
      song = Song.all.sort { |song_a, song_b| 
        song_a.name <=> song_b.name
      }[song_number - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end