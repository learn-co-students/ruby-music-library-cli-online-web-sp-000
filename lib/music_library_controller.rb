class MusicLibraryController
  require 'pry'
  attr_accessor :path, :music_importer

  def initialize(path = "./db/mp3s")
    @path = path
    @music_importer = MusicImporter.new(@path)
    @music_importer.import
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

    input = ""
    while input != "exit"
      input = gets
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
    count = 1
    Song.all.sort_by!{|song| song.name}.each do |song|
      puts "#{count}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      count += 1
    end
  end

  def list_artists
    count = 1
    Artist.all.sort_by!{|artist| artist.name}.each do |artist|
      puts "#{count}. #{artist.name}"
      count += 1
    end
  end

  def list_genres
    count = 1
    Genre.all.sort_by!{|genre| genre.name}.each do |genre|
      puts "#{count}. #{genre.name}"
      count += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets
    artist = Artist.find_by_name(artist_name)
    #binding.pry
    if artist != nil
      #list_songs_by_artist
      count = 1
      artist.songs.sort!{|a, b| a.name <=> b.name}.each do |song|
        puts "#{count}. #{song.name} - #{song.genre.name}"
        count += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets
    genre = Genre.find_by_name(genre_name)
    if genre != nil
      count = 1
      genre.songs.sort_by!{|song| song.name}.each do |song|
        puts "#{count}. #{song.artist.name} - #{song.name}"
        count += 1
      end
    end
  end

  def play_song
    #list_songs
    puts "Which song number would you like to play?"
    song_number = gets.to_i
    #binding.pry
    if song_number < Song.all.size && song_number > 0
      #binding.pry
      song = Song.all.sort{|a, b| a.name <=> b.name}[song_number - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
