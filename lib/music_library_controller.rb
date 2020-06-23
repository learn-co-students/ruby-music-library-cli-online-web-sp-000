require "pry"

class MusicLibraryController
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(@path).import
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
    4.times do user_input = gets.chomp end
  end

  def list_songs
    sorted_songs = Song.all.sort { |song_1, song_2| song_1.name <=> song_2.name }
    sorted_songs.each_with_index { |s, i| puts "#{i + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}" }
  end

  def list_artists
    sorted_artists = Artist.all.sort { |artist_1, artist_2| artist_1.name <=> artist_2.name }
    sorted_artists.each_with_index { |a, i| puts "#{i + 1}. #{a.name}" }
  end

  def list_genres
    sorted_genres = Genre.all.sort { |genre_1, genre_2| genre_1.name <=> genre_2.name }
    sorted_genres.each_with_index { |g, i| puts "#{i + 1}. #{g.name}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    all_artists = Artist.all.map { |artist| artist }
    if all_artists.any? { |artist| artist.name == user_input }
      matching_artist = Artist.all.select { |artist| artist.name == user_input }
      matching_artist.each_with_index { |a, i| puts "#{i + 1}. #{a.songs.name} - #{a.songs.genre}" }
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
  end

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp
  end
end

#   def list_songs
#     songs.each do |song| song.gsub(".mp3", "") end
#   end
# end
