require 'pry'
class MusicLibraryController
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
  end

  def call
    input = ""
    until input == 'exit' do
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets.chomp

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
    all_songs = Song.all.sort_by {|song| song.name}
    all_songs.each_with_index do |song, i|
      puts "#{i + 1}. #{all_songs[i].artist.name} - #{all_songs[i].name} - #{all_songs[i].genre.name}"
    end
  end

  def list_artists
    all_artists = Artist.all.sort_by {|artist| artist.name}
    all_artists.each_with_index do |artist, i|
      puts "#{i + 1}. #{artist.name}"
    end
  end

  def list_genres
    all_genres = Genre.all.sort_by {|genre| genre.name}
    all_genres.each_with_index do |genre, i|
      puts "#{i + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    if Artist.find_by_name(input)
      artist = Artist.find_by_name(input)
      sorted = artist.songs.sort_by {|song| song.name}
      sorted.each_with_index do |song, i|
        puts "#{i + 1}. #{song.name} - #{song.genre.name}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
    if Genre.find_by_name(input)
      genre = Genre.find_by_name(input)
      sorted = genre.songs.sort_by {|song| song.name}
      sorted.each_with_index do |song, i|
        puts "#{i + 1}. #{song.artist.name} - #{song.name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    all_songs = Song.all.sort_by {|song| song.name}
    if input.between?(1, all_songs.length)
      puts "Playing #{all_songs[input - 1].name} by #{all_songs[input - 1].artist.name}"
    end
  end

end
