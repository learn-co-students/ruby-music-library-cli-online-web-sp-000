require 'pry'
class MusicLibraryController
  def initialize(path='./db/mp3s')
    @importer = MusicImporter.new(path)
    @importer.import
  end

  def call
    response = ""
    while response != 'exit' do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      response = gets
      case response
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

    end
  end

  def list_songs
    Song.all.sort_by(&:name).each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    # Song.all.sort_by(&:name)
  end

  def list_artists
    Artist.all.sort_by(&:name).each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort_by(&:name).each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = Artist.find_or_create_by_name(gets)
    # binding.pry
    artist.songs.sort_by(&:name).each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} - #{song.genre.name}"
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = Genre.find_or_create_by_name(gets)
    genre.songs.sort_by(&:name).each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name}"
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input >= 0
      Song.all.sort_by(&:name).each_with_index do |s, i|
        if i + 1 == input
          puts "Playing #{s.name} by #{s.artist.name}"
        end
      end
    end
  end
end
