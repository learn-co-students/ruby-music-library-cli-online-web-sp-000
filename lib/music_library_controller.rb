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
    puts "What would you like to do?"

    user_input = ""

    until user_input == "exit"

      case user_input

      when 'list songs'

        list_songs

      when 'list artists'

        list_artists

      when 'list genres'

        list_genres

      when 'list artist'

        list_songs_by_artist

      when 'list genre'

        list_songs_by_genre

      when 'play song'

        play_song

      end

      user_input = gets.chomp
    end
  end


  def list_songs
    sorted_songs = Song.all.sort { |a, b| a.name <=> b.name }
    sorted_songs.each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists
    sorted_artists = Artist.all.sort  { |a, b| a.name <=> b.name }
    sorted_artists.each_with_index { |artist, index| puts "#{index + 1}. #{artist.name}" }
  end

  def list_genres
    sorted_genres = Genre.all.sort { |a, b| a.name <=> b.name }
    sorted_genres.each_with_index { |genre, index| puts "#{index + 1}. #{genre.name}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp

    if user_input
      artist = Artist.find_by_name(user_input)
      if artist
        sorted_songs = artist.songs.sort { |a, b| a.name <=> b.name }
        sorted_songs.each_with_index { |song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}" }
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp

    if user_input
      genre = Genre.find_by_name(user_input)
      if genre
        sorted_songs = genre.songs.sort { |a, b| a.name <=> b.name }
        sorted_songs.each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}" }
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp.to_i
    if user_input > 0 && user_input <= Song.all.length
      sorted_songs = Song.all.sort { |a, b| a.name <=> b.name }
      song = sorted_songs[user_input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

end
