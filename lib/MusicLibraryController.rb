require 'pry'

class MusicLibraryController
  
  attr_accessor :path
  
  def initialize(path = './db/mp3s')
    musicLibrary = MusicImporter.new(path)
    musicLibrary.import
  end
  
  def call
   input = ""
   while input != "exit"
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
      songs = Song.all
      songs = songs.each.sort_by(&:name)
      songs.uniq!
      songs.each_with_index{ |s, i| puts (i+1).to_s + ". " + s.artist.name + " - " + s.name + " - " + s.genre.name}
    end
    
    def list_artists
      artists = Artist.all
      artists = artists.each.sort_by(&:name)
      artists.uniq!
      artists.each_with_index{ |s, i| puts (i+1).to_s + ". " + s.name}
    end
    
    def list_genres
      genres = Genre.all
      genres = genres.each.sort_by(&:name)
      genres.uniq!
      genres.each_with_index{ |s, i| puts (i+1).to_s + ". " + s.name}
    end
    
    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist = gets.strip
      performer = Artist.find_by_name(artist)
      if performer != nil
        song_list = performer.songs
        song_list = song_list.each.sort_by(&:name)
        song_list.uniq!
        song_list.each_with_index{ |s, i| puts (i+1).to_s + ". " + s.name + " - " + s.genre.name}
      else
        "Artist not found. Please try again."
      end
    end
    
    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre = gets.strip
      desired_genre = Genre.find_by_name(genre)
      if desired_genre != nil
        song_list = desired_genre.songs
        song_list = song_list.each.sort_by(&:name)
        song_list.uniq!
        song_list.each_with_index{ |s, i| puts (i+1).to_s + ". " + s.artist.name + " - " + s.name}
      else
        "Artist not found. Please try again."
      end
    end 
    
    def play_song
      songs = Song.all
      songs = songs.each.sort_by(&:name)
      songs.uniq! 
      puts "Which song number would you like to play?"
      request = gets.strip.to_i
      if request != 0 && request <= songs.length - 1
        puts "Playing #{songs[request - 1].name} by #{songs[request - 1].artist.name}"
      else
      end
    end
    
end
  