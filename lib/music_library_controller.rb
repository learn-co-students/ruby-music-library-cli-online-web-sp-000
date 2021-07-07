class MusicLibraryController
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
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
    when "exit"
#     exit?
    else
      call
    end
  end

  def list_songs
    songs = Song.all.sort_by{|song| song.name}
    songs.each_with_index{|s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end

  def list_artists
    artists = Artist.all.sort_by{|artist| artist.name}
    artists.each_with_index{|a, i| puts "#{i + 1}. #{a.name}"}
  end

  def list_genres
    genres = Genre.all.sort_by{|genre| genre.name}
    genres.each_with_index{|g, i| puts "#{i + 1}. #{g.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    artist = Artist.find_by_name(input)
    if artist != nil
      songs = artist.songs.sort_by{|song| song.name}
      songs.each_with_index{|s, i| puts "#{i + 1}. #{s.name} - #{s.genre.name}"}
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    genre = Genre.find_by_name(input)
    if genre != nil
      songs = genre.songs.sort_by{|song| song.name}
      songs.each_with_index{|s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name}"}
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    index = input.to_i - 1
    songs = Song.all.sort_by{|song| song.name}
    if songs[index] != nil && Song.all.length >= input.to_i && input.to_i > 0
      song = songs[index].name
      artist = songs[index].artist.name
      puts "Playing #{song} by #{artist}"
    end
  end
end
