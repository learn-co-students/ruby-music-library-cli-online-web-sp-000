class MusicLibraryController

  attr_accessor :path

  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(path).import
  end

  def call

    input = ""
    until input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"

      input = gets.chomp.downcase

      case input
      when "list artists"
        list_artists
      when "list songs"
        list_songs
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
    alphabetized_songs = Song.all.sort_by! { |s| s.name }
    alphabetized_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    alphabetized_artists = Artist.all.sort_by! { |a| a.name }
    alphabetized_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    alphabetized_genres = Genre.all.sort_by! { |g| g.name }
    alphabetized_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    input = ""
    puts "Please enter the name of an artist:"
    input = gets.chomp

    Artist.all.each do |artist|
      if artist.name == input
        alphabetized_songs = artist.songs.sort_by! { |s| s.name }
        alphabetized_songs.each_with_index do |song, index|
          puts "#{index + 1}. #{song.name} - #{song.genre.name}"
        end
      end
    end
  end

  def list_songs_by_genre
    input = ""
    puts "Please enter the name of a genre:"
    input = gets.chomp

    Genre.all.each do |genre|
      if genre.name == input
        alphabetized_songs = genre.songs.sort_by! { |s| s.name }
        alphabetized_songs.each_with_index do |song, index|
          puts "#{index + 1}. #{song.artist.name} - #{song.name}"
        end
      end
    end
  end

  def play_song
    input = ""
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    alphabetized_songs = Song.all.sort_by! { |s| s.name }

    if input >= 1 && input < alphabetized_songs.length
      alphabetized_songs.each_with_index do |song, index|
        if index + 1  == input
          puts "Playing #{song.name} by #{song.artist.name}"
        end
      end
    end
  end

end
