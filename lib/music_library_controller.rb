require 'pry'

class MusicLibraryController
  def initialize(path="./db/mp3s")
    new_import = MusicImporter.new(path)
    new_import.import
  end

  def call_options
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

  def call
    input = nil
    until input == "exit"
      call_options
      input = gets
      if input == "list songs"
        list_songs
      elsif input == "list artists"
        list_artists
      elsif input == "list genres"
        list_genres
      elsif input == "list artist"
        list_songs_by_artist
      elsif input == "list genre"
        list_songs_by_genre
      elsif input == "play song"
        play_song
      end
    end
  end

  def sorted_items(item_class)
    item_class.all.sort! {|a,b| a.name <=> b.name}.uniq
  end

  def list_songs
    self.sorted_items(Song).collect.with_index do |song, index|
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    self.sorted_items(Artist).collect.with_index do |artist, index|
      puts "#{index + 1}. #{artist.name}"
    end
  end

  def list_genres
    self.sorted_items(Genre).collect.with_index do |genre, index|
      puts "#{index + 1}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets

    if Artist.find_by_name(name)
      sorted_artist_songs = Artist.find_by_name(name).songs.sort! {|a,b| a.name <=> b.name}
      sorted_artist_songs.each.with_index do |item, index|
        puts "#{index + 1}. #{item.name} - #{item.genre.name}"
      end
    else
      nil
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name = gets

    if Genre.find_by_name(name)
      sorted_genre_songs = Genre.find_by_name(name).songs.sort! {|a,b| a.name <=> b.name}
      sorted_genre_songs.each.with_index do |item, index|
        puts "#{index + 1}. #{item.artist.name} - #{item.name}"
      end
    else
      nil
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    song_index = gets.to_i - 1

    if song_index >= 0 && song_index <= sorted_items(Song).length - 1
      song_to_play = sorted_items(Song)[song_index]
      puts "Playing #{song_to_play.name} by #{song_to_play.artist.name}"
    else
      nil
    end
  end

end
