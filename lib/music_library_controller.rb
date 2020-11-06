require 'pry'
class MusicLibraryController

  def initialize(file_path = './db/mp3s')
    mi = MusicImporter.new(file_path)
    mi.import
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
    input = gets.chomp
    while input != "exit" do
      if input == "list songs"
        self.list_songs
      elsif input == "list artists"
        self.list_artists
      elsif input == "list genres"
        self.list_genres
      elsif input == "list artist"
        self.list_songs_by_artist
      elsif input == "list genre"
        self.list_songs_by_genre
      elsif input == "play song"
        self.play_song
      end
      input = gets.chomp
    end
  end
  def list_songs
    ordered_songs = Song.all.sort{|a, b| a.name <=> b.name}
    ordered_songs.each_with_index{|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"}
  end
  def list_artists
    sorted_artists = Artist.all.sort{|a, b| a.name <=> b.name}
    sorted_artists.each_with_index{|a, i| puts "#{i+1}. #{a.name}"}
  end
  def list_genres
    ordered_genres = Genre.all.sort{|a, b| a.name <=> b.name}
    ordered_genres.each_with_index{|g, i| puts "#{i+1}. #{g.name}"}
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets.chomp
    artist_obj = Artist.find_or_create_by_name(artist)
    song_array = artist_obj.songs.sort{|a, b| a.name <=> b.name}
    song_array.each_with_index{|s, i| puts "#{i+1}. #{s.name} - #{s.genre.name}"}
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets.chomp
    genre_obj = Genre.find_or_create_by_name(genre)
    genre_array = genre_obj.songs.sort{|a, b| a.name <=> b.name}
    genre_array.each_with_index{|s, i| puts "#{i+1}. #{s.artist.name} - #{s.name}"}
  end
  def play_song
    puts "Which song number would you like to play?"
    song_num = gets.chomp.to_i
    ordered_songs = Song.all.sort{|a, b| a.name <=> b.name}
      if song_num > 0 && song_num <= ordered_songs.length
        puts "Playing #{ordered_songs[song_num-1].name} by #{ordered_songs[song_num-1].artist.name}"
    end
  end
end
