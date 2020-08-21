class MusicLibraryController
  attr_reader :path
  
  def initialize(path = "./db/mp3s")
    @path = path 
    MusicImporter.new(path).import
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
    
    input = gets.chomp
    
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
   end
  end
  
  def list_songs
    Song.all.sort_by(&:name).each.with_index(1) do |song, indx|
      puts "#{indx}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end
  
  def list_artists
    Artist.all.sort_by(&:name).each.with_index(1) do |artist, indx|
      puts "#{indx}. #{artist.name}"
    end
  end
  
  def list_genres
    Genre.all.sort_by(&:name).each.with_index(1) do |genre, indx|
      puts "#{indx}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.chomp
    
    if artist = Artist.find_by_name(input)
      artist.songs.sort_by(&:name).each.with_index(1) do |song, indx|
      puts "#{indx}. #{song.name} - #{song.genre.name}"
    end
   end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.chomp
    
    if genre = Genre.find_by_name(input)
      genre.songs.sort_by(&:name).each.with_index(1) do |song, indx|
        puts "#{indx}. #{song.artist.name} - #{song.name}"
      end 
    end
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i
    if (1..Song.all.length).include?(input)
      array = Song.all.sort_by(&:name)
      song = array[input-1]
    puts "Playing #{song.name} by #{song.artist.name}" 
   end
 end
  
end

