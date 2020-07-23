class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
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
    
    begin 
      command = gets.strip
      case command
      when 'list songs'
        list_songs
      when 'list artists'
        list_artists
      when 'list genres'
        list_genres
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'play song'
        play_song
      else 
       # puts "Please enter a valid command."
      end
    end until command == 'exit'
  end
    
    def list_songs
      Song.all.sort {|a, b| a.name <=> b.name}.each_with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end
    
    def list_artists
      Artist.all.sort {|a, b| a.name <=> b.name}.each_with_index{|artist, index| puts "#{index + 1}. #{artist.name}"}
    end
    
    def list_genres
      Genre.all.sort {|a, b| a.name <=> b.name}.each_with_index{|genre, index| puts "#{index + 1}. #{genre.name}"}
    end
    
    def list_songs_by_artist
      puts "Please enter the name of an artist:"
      artist_name = gets.strip
      Artist.find_by_name(artist_name).songs.sort {|a, b| a.name <=> b.name}.each_with_index{|song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"} if Artist.find_by_name(artist_name)
    end
    
    def list_songs_by_genre
      puts "Please enter the name of a genre:"
      genre_name = gets.strip
      Genre.find_by_name(genre_name).songs.sort {|a, b| a.name <=> b.name}.each_with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"} if Genre.find_by_name(genre_name)
    end
    
    def play_song
      puts "Which song number would you like to play?"
      song_number = gets.strip.to_i
      if song_number_valid?(song_number)
        song = Song.all.sort {|a, b| a.name <=> b.name}[song_number - 1]
        puts "Playing #{song.name} by #{song.artist.name}"
      end
    end
    
    def song_number_valid?(song_number)
      song_number > 0 && song_number < Song.all.size
    end

end