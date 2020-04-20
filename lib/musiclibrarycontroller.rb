require "pry"

class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import
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
      return "exit"
    elsif input == "list songs"
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
    call
  end
  
  def list_songs
    if input = "list songs"
      Song.all.sort_by! {|songs| songs.name}
      Song.all.each.with_index {|songs, index| puts "#{index + 1}. #{songs.artist.name} - #{songs.name} - #{songs.genre.name}"}
    end
  end
  
  def list_artists
    if input = "list artists"
      Artist.all.sort_by! {|artists| artists.name}
      Artist.all.each_with_index {|artists, index| puts "#{index + 1}. #{artists.name}"}
    end
  end
  
  def list_genres
    if input = "list genres"
      Genre.all.sort_by! {|genres| genres.name}
      Genre.all.each_with_index {|genres, index| puts "#{index + 1}. #{genres.name}"}
    end
  end
  
  def list_songs_by_artist
    if input = "list artist"
      puts "Please enter the name of an artist:"
      input2 = gets.strip
    end
    if artist = Artist.find_by_name(input2)
      artist.songs.sort_by! {|songs| songs.name}
      artist.songs.each_with_index {|songs, index| puts "#{index + 1}. #{songs.name} - #{songs.genre.name}"}
    end
  end
  
  def list_songs_by_genre
    if input = "list genre"
      puts "Please enter the name of a genre:"
      input2 = gets.strip
    end
    if genre = Genre.find_by_name(input2)
      genre.songs.sort_by! {|songs| songs.name}
      genre.songs.each_with_index {|songs, index| puts "#{index + 1}. #{songs.artist.name} - #{songs.name}"}
    end
  end
  
  def play_song
    if input = "play song"
      puts "Which song number would you like to play?"
      input2 = gets.strip.to_i
    end
      if input2 > 0 && input2 <= Song.all.length
        new_array = Song.all.sort_by! {|songs| songs.name}
        song = new_array[input2 - 1]
        puts "Playing #{song.name} by #{song.artist.name}"
      end
  end
  
# binding.pry

end

