require 'pry'
class MusicLibraryController
  def initialize(path="./db/mp3s")
    music = MusicImporter.new(path)
    music.import
  end

  def input_to_index(num)
     num.to_i - 1
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
    input = gets.strip

    if input == "exit"
    elsif input == "list songs"
      list_songs
      call
    elsif input == "list artists"
      list_artists
      call
    elsif input == "list genres"
      list_genres
      call
    elsif input == "list artist"
      list_songs_by_artist
      call
    elsif input == "list genre"
      list_songs_by_genre
      call
    elsif input == "play song"
      play_song
      call
    else
      call
    end

  end

  def list_songs
    num = 0
    Song.all.sort{|a, b| a.name <=> b.name}.each{|song| puts "#{num+=1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end

  def list_artists
    num = 0
    Artist.all.sort{|a, b| a.name <=> b.name}.each{|artist| puts "#{num+=1}. #{artist.name}"}
  end

  def list_genres
    num = 0
    Genre.all.sort{|a, b| a.name <=> b.name}.each{|genre| puts "#{num+=1}. #{genre.name}"}
  end

  def list_songs_by_artist
    num = 0
    puts "Please enter the name of an artist:"
    artist_input = gets.strip
    artist = Artist.all.find {|artist| artist_input == artist.name}
    if artist
       artist.songs.sort{|a, b| a.name <=> b.name}.each{|s| puts "#{num+=1}. #{s.name} - #{s.genre.name}"}
    end
  end

  def list_songs_by_genre
    num = 0
    puts "Please enter the name of a genre:"
    genre_input = gets.strip
    genre = Genre.all.find {|genre| genre.name == genre_input}
    if genre
      genre.songs.sort{|a, b| a.name <=> b.name}.each{|s| puts "#{num+=1}. #{s.artist.name} - #{s.name}" }
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip
    song_number = input.to_i
    song_list = Song.all.sort{|a, b| a.name <=> b.name}
    if song_number > 0 && song_number < song_list.length
        song_list = song_list[song_number - 1]
       puts "Playing #{song_list.name} by #{song_list.artist.name}"
    end
  end
end
