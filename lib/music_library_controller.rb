class MusicLibraryController
  attr_accessor :path, :artist, :genre
  
  def initialize(path = './db/mp3s')
    MusicImporter.new(path).import
    @path = path
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
    user_input = gets.strip
      case user_input 
        when "list songs"
          list_songs
        when "list artists"
          list_artists
        when "list genres"
          list_genres
        when "list songs by artist"
          list_songs_by_artist
        when "list songs by genre"
          list_songs_by_genre
        when "play song"
          play_song
        when "list artist"
          list_songs_by_artist
        when "list genre"
          list_songs_by_genre
        end
      end
    end
      
  def list_songs
    sorted_songs = Song.all.sort {|a,b| a.name<=>b.name}
    sorted_songs.each_with_index do |s, index| 
    puts "#{index + 1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
  end
  
  def list_artists
    sorted_artists = Artist.all.sort {|a,b| a.name<=>b.name}
    sorted_artists.each_with_index do |a, index| 
    puts "#{index + 1}. #{a.name}"
    end
  end
  
  def list_genres
    sorted_genres = Genre.all.sort {|a,b| a.name<=>b.name}
    sorted_genres.each_with_index do |g, index| 
    puts "#{index + 1}. #{g.name}"
    end
  end
  
 def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    artist = Artist.find_by_name(user_input) 
      if artist 
        artist.songs.sort{|a,b| a.name<=>b.name}.each_with_index do |s, index| 
        puts "#{index + 1}. #{s.name} - #{s.genre.name}"
      end
    end 
  end 
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    genre = Genre.find_by_name(user_input) 
      if genre 
        genre.songs.sort{|a,b| a.name<=>b.name}.each_with_index do |s, index| 
        puts "#{index + 1}. #{s.artist.name} - #{s.name}"
      end
    end 
  end 

  def play_song
    puts "Which song number would you like to play?"
    user_input = gets.chomp.to_i
      if (1..Song.all.length).include?(user_input)
        song = Song.all.sort {|a,b| a.name<=>b.name} [user_input - 1]
        puts "Playing #{song.name} by #{song.artist.name}"
    end
  end
end
