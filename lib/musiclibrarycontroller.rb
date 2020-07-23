class MusicLibraryController
  attr_reader :imported_library

  def initialize (path = "./db/mp3s")
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
    input = gets.strip
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
    else
      call unless input == "exit"
    end
  end

  def list_songs
    sorted_by_song_name = Song.all.sort {|s1, s2| s1.name <=> s2.name}
    sorted_by_song_name.each_with_index do |song, i|
      puts "#{i + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    artists_names = []
    Artist.all.each {|artist| artists_names << artist.name unless artists_names.include?(artist.name)}
    sorted_artist_names = artists_names.sort {|name1, name2| name1 <=> name2}
    sorted_artist_names.each_with_index do |name, i|
      puts "#{i + 1}. #{name}"
    end
  end

  def list_genres
    genre_names = []
    Genre.all.each {|genre| genre_names << genre.name unless genre_names.include?(genre.name)}
    sorted_genre_names = genre_names.sort {|name1, name2| name1 <=> name2}
    sorted_genre_names.each_with_index do |name, i|
      puts "#{i + 1}. #{name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    songs_by_artist = []
    Song.all.each {|song| songs_by_artist << "#{song.name} - #{song.genre.name}" if song.artist.name == input}
    songs_by_artist.sort.each_with_index do |song, i|
      puts "#{i + 1}. #{song}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    songs_by_genre = []
    sorted_by_song_name_alphabetically = []
    sorted_by_song_name_alphabetically = Song.all.sort {|song1, song2| song1.name <=> song2.name}
    sorted_by_song_name_alphabetically.each {|song| songs_by_genre << "#{song.artist.name} - #{song.name}" if song.genre.name == input}
    songs_by_genre.each_with_index do |song, i|
      puts "#{i + 1}. #{song}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    sorted_by_song_name = Song.all.sort {|s1, s2| s1.name <=> s2.name}
    puts "Playing #{sorted_by_song_name[input-1].name} by #{sorted_by_song_name[input-1].artist.name}" unless input > sorted_by_song_name.size || input <= 0
  end

end
