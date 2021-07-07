class MusicLibraryController

  def initialize(path = "./db/mp3s")
    library = MusicImporter.new(path)
    library.import
  end

  def call
    input = ""
    while input != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets.strip
    case input
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
    end
  end

  def list_songs
    i = 1
    ordered_songs = Song.all.sort_by {|song| song.name}
    ordered_songs.collect {|song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i += 1
    }
  end

  def list_artists
    i = 1
    ordered_artists = Artist.all.sort_by {|artist| artist.name}
    ordered_artists.each {|artist|
      puts "#{i}. #{artist.name}"
      i += 1
    }
  end

  def list_genres
    i = 1
    ordered_genre = Genre.all.sort_by {|genre| genre.name}
    ordered_genre.each {|genre|
      puts "#{i}. #{genre.name}"
      i += 1
    }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    requested_artist = gets.strip
    songs = Song.all.select {|song| song.artist.name == requested_artist}
    i = 1
    songs = songs.sort_by {|song| song.name}
    songs.each {|song|
      puts "#{i}. #{song.name} - #{song.genre.name}"
      i += 1
    }
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    requested_genre = gets.strip
    songs = Song.all.select {|song| song.genre.name == requested_genre}
    i = 1
    songs = songs.sort_by {|song| song.name}
    songs.each {|song|
      puts "#{i}. #{song.artist.name} - #{song.name}"
      i += 1
    }
  end

  def playing(index)
    song = Song.all[index]
    puts "Now Playing #{song.name} by #{song.artist.name}"
  end



  def play_song
    input = 0
    i = 1
    puts "Which song number would you like to play?"
    input = gets.to_i
    index = input - 1
    song = Song.all[index]
    puts "Playing #{song.name} by #{song.artist.name}" if input > 0 && input < Song.all.count
  end

end
