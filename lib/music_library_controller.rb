class MusicLibraryController
  attr_reader :idx

  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
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

      input = gets.chomp
    end
  end

  def list_songs
    Song.all.sort_by(&:name).each.with_index(1) do |song, idx|
      puts "#{idx}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    Artist.all.sort_by(&:name).each.with_index(1) do |art, idx|
      puts "#{idx}. #{art.name}"
    end
  end

  def list_genres
    Genre.all.sort_by(&:name).each.with_index(1) do |gen, idx|
      puts "#{idx}. #{gen.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.chomp
    idx = 1
    Song.all.sort_by(&:name).each do |song|
      if song.artist.name == artist_name
        puts "#{idx}. #{song.name} - #{song.genre.name}"
        idx += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_style = gets.chomp
    idx = 1
    Song.all.sort_by(&:name).each do |song|
      if song.genre.name == genre_style
        puts "#{idx}. #{song.artist.name} - #{song.name}"
        idx += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.strip.to_i
    if song_number > 1 && song_number < Song.all.length
      song = Song.all[song_number]
      puts "Playing #{song.name} by #{song.artist.name}" if song
    end
  end

end
