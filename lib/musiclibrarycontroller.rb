class MusicLibraryController
  attr_accessor :path
  
  def initialize(path='./db/mp3s')
    @path = path
    MusicImporter.new(path).import
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
    user_input = gets.chomp
    
      case user_input
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
        when "exit"
          exit
        else
          puts "Invalid entry"
      end
    end
  end
  
  def list_songs
    Song.all.sort {|a, b| a.name <=> b.name}.each_with_index do |song, index|
      puts "#{index + 1}. #{song.name} #{song.artist.name} #{song.genre.name}"
    end
  end
  
  def list_artists
    artists = Artist.all.map {|artist| artist.name}.uniq.sort
    artists.each_with_index {|artist, index| puts "#{index + 1}. #{artist}"}
  end
  
  def list_genres
    genres = Genre.all.map {|genre| genre.name}.uniq.sort
    genres.each_with_index {|genre, index| puts "#{index + 1}. #{genre}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.chomp
    
    unless Artist.find_by_name(user_input) == nil
      artist = artist = Artist.find_by_name(user_input)
      artist.songs.sort {|a, b| a.name <=> b.name}.each_with_index do |song, index|
        puts "#{index + 1} #{song.name} #{song.genre.name}"
      end
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    user_input = gets.chomp
    
    unless Genre.find_by_name(user_input) == nil
      genre = Genre.find_by_name(user_input)
      genre.songs.sort {|a, b| a.name <=> b.name}.each_with_index do |song, index|
        puts "#{index + 1}. #{song.name} #{song.artist.name}"
      end
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    songs = Song.all
    print "Please select between 1 and #{songs.length}: "
    user_input = gets.chomp.to_i
    
    
    if (1..songs.length).include?(user_input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[user_input - 1]
      puts "Playing #{song.name} by #{song.artist.name}"
    else
      puts "You made an invalid entry. Please try again"
      puts
    end
  end
  
end