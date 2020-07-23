require './config/environment.rb'

class MusicLibraryController

  WELCOME_MESSAGES = [
    "Welcome to your music library!",
    "To list all of your songs, enter 'list songs'.",
    "To list all of the artists in your library, enter 'list artists'.",
    "To list all of the genres in your library, enter 'list genres'.",
    "To list all of the songs by a particular artist, enter 'list artist'.",
    "To list all of the songs of a particular genre, enter 'list genre'.",
    "To play a song, enter 'play song'.",
    "To quit, type 'exit'.",
    "What would you like to do?"
  ]

  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end

  def call
    WELCOME_MESSAGES.each {|message| puts message}
    input = ""
    until input == 'exit' do
      input = gets.chomp.downcase
      case input
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
      end
    end
  end

  def list_songs
    sorted_songs = Song.all.sort_by {|song| song.name}
    sorted_songs.each_with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    sorted_artists = Artist.all.sort_by {|artist| artist.name}
    sorted_artists.each_with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    soreted_genres = Genre.all.sort_by {|genre| genre.name}
    soreted_genres.each_with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input  = gets.chomp.downcase
    found  = Artist.find_by_name(input)
    if found
      sorted_songs = found.songs.sort_by {|song| song.name}
      sorted_songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input  = gets.chomp.downcase
    found  = Genre.find_by_name(input)
    if found
      sorted_songs = found.songs.sort_by {|song| song.name}
      sorted_songs.each_with_index do |song, index|
        puts "#{index + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    sorted_songs = Song.all.sort_by {|song| song.name}
    if input >= 1 && input <= sorted_songs.length
      song = sorted_songs[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
