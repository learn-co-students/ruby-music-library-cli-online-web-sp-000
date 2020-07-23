require "pry"

class MusicLibraryController

  def initialize(path = './db/mp3s')
    muscic_importer = MusicImporter.new(path)
    muscic_importer.import()
  end

  def call
    display_menu
    input = ""

    while input != "exit"
        case input
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
      input = gets.chomp 
    end
  end

  def list_songs    
    songs = Song.all.sort_by { |song| song.name }
    songs.each_with_index do |song, index|
      puts "#{index + 1 }. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
    end
  end

  def list_artists
    artists = Artist.all.sort_by { |artist| artist.name }
    artists.each_with_index do |artist, index|
      puts "#{index + 1 }. #{artist.name}" 
    end
  end

  def list_genres
    genres = Genre.all.sort_by { |genre| genre.name }
    genres.each_with_index do |genre, index|
      puts "#{index + 1 }. #{genre.name}" 
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets.chomp
      if artist = Artist.find_by_name(name)
        artist_songs = artist.songs.sort_by { |song| song.name }
        artist_songs.each_with_index do |song, index| 
        puts "#{index + 1 }. #{song.name} - #{song.genre.name}"
        end
      end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.chomp
      if genre = Genre.find_by_name(genre)
        song_genres = genre.songs.sort_by { |song| song.name }
        song_genres.each_with_index do |song, index| 
        puts "#{index + 1 }. #{song.artist.name} - #{song.name}"
        end
      end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_number = gets.chomp.to_i
    songs = Song.all.sort_by { |song| song.name } 
      if (1..songs.length).include?(song_number)
        puts "Playing #{songs[song_number -1].name} by #{songs[song_number - 1].artist.name}"
      end
  end



  private

    def display_menu
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
    end
end