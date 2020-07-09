require 'pry'

class MusicLibraryController

  attr_accessor :path

  def initialize(filepath = './db/mp3s')
    @path = filepath
    MusicImporter.new(filepath).import
    @song_list = Song.all.flatten.sort_by{|song|song.name}.uniq
    @artist_list = Artist.all.flatten.sort_by{|artist|artist.name}.uniq
    @genre_list = Genre.all.flatten.sort_by{|genre|genre.name}.uniq
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
    until @input == 'exit' do
      @input = gets.strip
      if @input == "list songs"
        list_songs
      elsif @input == "list artists"
        list_artists
      elsif @input == "list genres"
        list_genres
      elsif @input == "list artist"
        list_songs_by_artist
      elsif @input == "list genre"
        list_songs_by_genre
      elsif @input == "play song"
        play_song
      end
    end
  end

  def list_songs
    @song_list.each_with_index do |song, index|
      num = index += 1
      name = song.name
      artist = song.artist.name
      genre = song.genre.name
      puts "#{num}. #{artist} - #{name} - #{genre}"
    end
  end

  def list_artists
    @artist_list.each_with_index do |artist, index|
      num = index += 1
      name = artist.name
      puts "#{num}. #{name}"
    end
  end

  def list_genres
    @genre_list.each_with_index do |genre, index|
      num = index += 1
      name = genre.name
      puts "#{num}. #{name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    artist = Song.all.find_all {|song| song.artist.name == artist_name}
    if artist.length > 0
      @song_by_artist_list = artist
      @song_by_artist_list.flatten.sort_by{|song|song.name}.uniq.each_with_index do |song, index|
        num = index += 1
        name = song.name
        genre = song.genre.name
        puts "#{num}. #{name} - #{genre}"
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip
    genre = Song.all.find_all { |song| song.genre.name == genre_name}
    if genre.length > 0
      @song_by_genre_list = genre
      @song_by_genre_list.flatten.sort_by{|song|song.name}.uniq.each_with_index do |song, index|
        num = index += 1
        name = song.name
        artist = song.artist.name
        puts "#{num}. #{artist} - #{name}"
      end
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    selection = gets.strip
    number = selection.to_i
    number -= 1
    if number >= 0
      song = @song_list[number]
      if song != nil
        name = song.name
        artist = song.artist.name
        puts "Playing #{name} by #{artist}"
      end
    end
  end
end
