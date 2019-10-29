class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end
  
  def call
    user_input = ""
    safety = 0 # prevent infinite loop
    while user_input != "exit"
      # Welcome and Infor
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      #input
      user_input = gets.strip
      
      # prevent infinite loop
      raise "break Possible infinite loop"  if safety >= 15
      safety += 1
      user_input
    end
  end
  
  def list_songs
    song_list = Song.all.collect {|song| song }.uniq.sort
    song_list.each_with_index do
      |song, index| 
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
    end
  end

  def list_artists
    artist_name = Artist.all.collect {|artist| artist.name }.uniq.sort
    artist_name.each_with_index { |artist, index| puts "#{index+1}. #{artist}" }
  end
  
  def list_genres
    genre_name_name = Genre.all.collect {|genre| genre.name }.uniq.sort
    genre_name_name.each_with_index { |genre, index| puts "#{index+1}. #{genre}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip
    
    artist = Artist.find_by_name(artist_name)
    return nil unless artist
    song_list = artist.songs.collect {|song| song }.uniq.sort
    song_list.each_with_index do
      |song, index| 
      puts "#{index+1}. #{song.name} - #{song.genre.name}" 
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_type = gets.strip
    
    genre = Genre.find_by_name(genre_type)
    return nil unless genre
    song_list = genre.songs.collect {|song| song}.uniq.sort
    song_list.each_with_index do
      |song, index| 
      puts "#{index+1}. #{song.artist.name} - #{song.name}" 
    end
  end

   def play_song
    puts "Which song number would you like to play?"
    user_select = gets.strip.to_i
    song = Song.all.sort[user_select - 1] if user_select.positive? 
    puts "Playing #{song.name} by #{song.artist.name}" if song
  end
  
end
