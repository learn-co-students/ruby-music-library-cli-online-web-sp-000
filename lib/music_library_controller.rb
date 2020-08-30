require 'pry'

class MusicLibraryController

  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
    @alphabetized_song_all = Song.all.uniq.sort_by {|song| song.name}
  end

  def call
    user_input = ""
    until user_input == "exit"
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.chomp
      if user_input == 'list songs'
        list_songs
      elsif user_input == 'list artists'
        list_artists
      elsif user_input == 'list genres'
        list_genres
      elsif user_input == 'list artist'
        list_songs_by_artist
      elsif user_input == 'list genre'
        list_songs_by_genre
      elsif user_input == 'play song'
        play_song
      else
      end
    end
  end


  def list_songs
    list_number = 1
    @alphabetized_song_all.each do |song|
      puts "#{list_number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      list_number += 1
    end
  end

  def list_artists
    alphabetized_artist_all = Artist.all.uniq.sort_by {|artist| artist.name}
    list_number = 1
    alphabetized_artist_all.each do |artist|
      puts "#{list_number}. #{artist.name}"
      list_number += 1
    end
  end

  def list_genres
    alphabetized_genre_all = Genre.all.uniq.sort_by {|genre| genre.name}
    list_number = 1
    alphabetized_genre_all.each do |genre|
      puts "#{list_number}. #{genre.name}"
      list_number += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp
    artist_requested = Artist.find_by_name(artist)
    if artist_requested != nil
      artist_songs_alphabetized = artist_requested.songs.sort_by {|song| song.name}
      list_number = 1
      artist_songs_alphabetized.each do |song|
        puts "#{list_number}. #{song.name} - #{song.genre.name}"
        list_number += 1
      end
    else
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.chomp
    genre_requested = Genre.find_by_name(genre)
    if genre_requested != nil
      genre_songs_alphabetized = genre_requested.songs.sort_by {|song| song.name}
      list_number = 1
      genre_songs_alphabetized.each do |song|
        puts "#{list_number}. #{song.artist.name} - #{song.name}"
        list_number += 1
      end
    else
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    choice = gets.chomp
    choice_int = choice.to_i
    max = @alphabetized_song_all.count
    if choice_int.between?(1, max)
      list_number = 1
      @alphabetized_song_all.each do |song|
        if list_number == choice_int
          puts("Playing #{song.name} by #{song.artist.name}")
        else
        end
        list_number += 1
      end
    else
    end
  end
end
