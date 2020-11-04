class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path).import
  end

  def call
  loop do
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
      when "exit"
        break
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
    counter = 1
    Song.all.sort { |a,b| a.name <=> b.name }.each do |s|
      puts "#{counter}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      counter += 1
    end
  end

  def list_artists
    counter = 1
    Artist.all.sort { |a,b| a.name <=> b.name }.each do |a|
      puts "#{counter}. #{a.name}"
      counter += 1
    end
  end

  def list_genres
    counter = 1
    Genre.all.sort { |a,b| a.name <=> b.name }.each do |g|
      puts "#{counter}. #{g.name}"
      counter += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    counter = 1
    if Artist.find_by_name(input) != nil
      Artist.find_by_name(input).songs.sort { |a,b| a.name <=> b.name }.each do |s|
      puts "#{counter}. #{s.name} - #{s.genre.name}"
      counter += 1
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    counter = 1
    if Genre.find_by_name(input) != nil
      Genre.find_by_name(input).songs.sort { |a,b| a.name <=> b.name }.each do |s|
        puts "#{counter}. #{s.artist.name} - #{s.name}"
        counter += 1
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_list = Song.all.sort { |a,b| a.name <=> b.name }
    input = gets.to_i
    # binding.pry
    if input <= Song.all.length && input > 0
      puts "Playing #{song_list[input - 1].name} by #{song_list[input - 1].artist.name}"
    end
  end

end
