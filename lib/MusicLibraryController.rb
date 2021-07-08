class MusicLibraryController

  def initialize(path = "./db/mp3s")
    @path = path
    new_import = MusicImporter.new(@path)
    new_import.import
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
    exit = false
    while exit == false do
    input = gets.chomp
    input == "exit" ? exit = true : exit = false
      if input == "list songs"
        self.list_songs
      elsif input == "list artists"
        self.list_artists
      elsif input == "list genres"
        self.list_genres
      elsif input == "list artist"
        self.list_songs_by_artist
      elsif input == "list genre"
        self.list_songs_by_genre
      elsif input == "play song"
        self.play_song
      end
    end

  end # OF CALL


  def list_songs
    count = 1
    sorted_songs = Song.all.sort do |a,b|
      a.name <=> b.name
    end
    sorted_songs.each do |song|
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      count +=1
    end
  end

  def list_artists
    count = 1
    sorted_artists = Artist.all.sort do |a,b|
      a.name <=> b.name
    end
    sorted_artists.each do |artist|
      puts "#{count}. #{artist.name}"
      count +=1
    end
  end

  def list_genres
    count = 1
    sorted_genres = Genre.all.sort do |a,b|
      a.name <=> b.name
    end
    sorted_genres.each do |genre|
      puts "#{count}. #{genre.name}"
      count +=1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_selection = gets.chomp

    count = 1
    sorted_songs = Song.all.sort do |a,b|
      a.name <=> b.name
    end
    sorted_songs.each do |song|
      if song.artist.name == artist_selection
        puts "#{count}. #{song.name} - #{song.genre.name}"
        count +=1
      end
    end


  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_selection = gets.chomp

    count = 1
    sorted_songs = Song.all.sort do |a,b|
      a.name <=> b.name
    end
    sorted_songs.each do |song|
      if song.genre.name == genre_selection
        puts "#{count}. #{song.artist.name} - #{song.name}"
        count +=1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_selection = gets.chomp.to_i - 1

    sorted_songs = Song.all.sort do |a,b|
      a.name <=> b.name
    end

    if sorted_songs[song_selection] != nil && song_selection <= sorted_songs.length+1 && song_selection >= 0
    selected_song = sorted_songs[song_selection].name
    selected_artist = sorted_songs[song_selection].artist.name
      puts "Playing #{selected_song} by #{selected_artist}"
    end

  end

end
