class MusicLibraryController
  
  attr_accessor :path, :musicimporter, :artist, :songs, :genre, :name
  
  @@ordered_songs = [ ]
  
  def initialize(path = './db/mp3s')
    @path = path
    @musicimporter = MusicImporter.new(@path)
    @musicimporter.import
  end
  
  def call
    counter = 0
    until counter == 1
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      input = gets
      if input == "exit"
        counter = 1
      else
        counter = 0
      end
      if input == 'list songs'
        list_songs
        counter = 1
        elsif input == 'list artists'
        list_artists
        counter = 1
        elsif input == 'list genres'
        list_genres
        counter = 1
        elsif input == "list artist"
        list_songs_by_artist
        counter = 1
        elsif input == 'list genre'
        list_songs_by_genre
        counter = 1
        elsif input == 'play song'
        play_song
        counter = 1
      end
        
    end
  end
  
  def list_songs
    importer = self.musicimporter
    importer.files
    
    #format is #. Artist - Song - Genre
    ordered = [ ]
    number = 1
    songs = Song.all
    
    #removing duplicates
    no_duplicates = [ ]
    songs.collect do |song|
      if no_duplicates.include?(song) == false
        no_duplicates << song
      end
    end
  
    alphabetized = no_duplicates.sort_by {|song| song.name}
    #now putting the alphabetized into the proper format
    alphabetized.each do |song|
      ordered << "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      number += 1
    end
   
   #now putting each one out individually
   @@ordered_songs = [ ]
    counter = 0 
    until counter == alphabetized.size
     puts ordered[counter]
      counter += 1
    end
    @@ordered_songs = ordered
  end
  
  
  def list_artists
    artists = Artist.all
    artist_names = [ ]
    
    artists.each do |artist|
     #making sure there are no duplicates
     if artist_names.include?(artist.name) == false 
       artist_names << artist.name
     end
    end
    
    #alphabetizing artists
    alphabetized = artist_names.sort_by {|artist| artist}
    
    #now putting the alphabetized into the proper format
    ordered = [ ]
    number = 1
    alphabetized.each do |artist|
      ordered << "#{number}. #{artist}"
      number += 1
    end
    
    #outputting each numbered and ordered artist individually
    ordered.collect do |artist|
      puts artist
    end
  end
  
  
  def list_genres
    genres = Genre.all
    genre_names = [ ]
    genres.each do |genre|
     #making sure there are no duplicates
     if genre_names.include?(genre.name) == false 
       genre_names << genre.name
     end
    end
    #alphabetizing
    alphabetized = genre_names.sort_by {|genre| genre}
    #now putting the alphabetized into the proper format
    ordered = [ ]
    number = 1
    alphabetized.each do |genre|
      ordered << "#{number}. #{genre}"
      number += 1
    end
    #outputting each numbered and ordered genre individually
    ordered.collect do |genre|
      puts genre
    end
    
  end
  
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    all_songs = Song.all
    songs_to_order = [ ]
    all_songs.each do |song|
      if song.artist.name == input 
        #making sure there are no duplicates
        if songs_to_order.include?(song.name + " - " + song.genre.name) == false
          songs_to_order << song.name + " - " + song.genre.name
        end
      end
       songs_to_order
    end
    alphabetized = songs_to_order.sort_by {|song| song}
    ordered = [ ]
    number = 1
    alphabetized.each do |song|
      ordered << "#{number}. #{song}"
      number += 1
    end
    ordered.collect do |song|
      puts song
    end
  end
  
  def list_songs_by_genre
     puts "Please enter the name of a genre:"
    input = gets
    all_songs = Song.all
    alphabetizing = all_songs.sort_by {|song| song.name}
    alphabetized = alphabetizing.uniq
    songs_to_number = [ ]
    alphabetized.each do |song|
      if song.genre.name == input
        #making sure there are no duplicates
       if songs_to_number.include?(song.artist.name + " - " + song.name) == false
          songs_to_number << song.artist.name + " - " + song.name
        end
      end
       p songs_to_number
    end
    ordered = [ ]
    number = 1
    songs_to_number.each do |song|
      ordered << "#{number}. #{song}"
      number += 1
    end
    ordered.collect do |song|
      puts song
    end
  end
  
  
  def play_song
    puts "Which song number would you like to play?"
    p input = gets
    
     access = input.to_i - 1
     ##HOW DO I HAVE THE WRONG SONG LIST?!!!
     p @@ordered_songs
   
    if input.to_i > @@ordered_songs.size
      nil
    elsif input.to_i <= 0
      nil
    else
      #list_songs
      song_to_play = @@ordered_songs[access].split(" - ")
      song_name = song_to_play[1]
      artist_and_number = song_to_play[0].split(".")
      artist_name = artist_and_number[1]
      puts "Playing #{song_name} by#{artist_name}"
     
    end
  
  end
  
  
end