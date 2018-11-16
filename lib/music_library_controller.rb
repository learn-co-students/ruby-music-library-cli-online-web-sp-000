class MusicLibraryController
  def initialize(path = './db/mp3s')
    music = MusicImporter.new(path)
    music.import
  end

  def call
    input = ""
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    while input != "exit"
      input = gets.strip
      if input == "list songs"
        self.list_songs
      end
      if input == "list artists"
        self.list_artists
      end
      if input == "list genres"
        self.list_genres
      end
      if input == "list artist"
        self.list_songs_by_artist
      end
      if input == "list genre"
        self.list_songs_by_genre
      end
      if input == "play song"
        self.play_song
      end
    end

  end

  def list_songs
    list_songs = Song.all.sort_by {|song| song.name}
    list_songs.each_with_index do |value, index|
      puts "#{index + 1}. #{value.artist.name} - #{value.name} - #{value.genre.name}"
    end
    list_songs
  end

  def list_artists
    list_artists = Artist.all.sort_by {|artist| artist.name}
    list_artists.each_with_index do |value, index|
      puts "#{index + 1}. #{value.name}"
    end
  end

  def list_genres
    list_genres = Genre.all.sort_by {|genre| genre.name}
    list_genres.each_with_index do |value, index|
      puts "#{index + 1}. #{value.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    if artist = Artist.find_by_name(input)
      songs = artist.songs.sort_by{|song| song.name}
      songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    if genre = Genre.find_by_name(input)
      songs = genre.songs.sort_by {|song| song.name}
      songs.each_with_index do |song, index|
       puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    input -= 1
    list_songs = Song.all.sort_by {|song| song.name}
    if input >= 0 && input <= list_songs.length && input.is_a?(Integer) && list_songs[input]
      puts "Playing #{list_songs[input].name} by #{list_songs[input].artist.name}"
    end
  end
end
