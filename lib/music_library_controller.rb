class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    #self.path = path
    music = MusicImporter.new(path)
    @songs = music.import
  end
  
  def call
    puts ("Welcome to your music library!")
    puts ("To list all of your songs, enter 'list songs'.")
    puts ("To list all of the artists in your library, enter 'list artists'.")
    puts ("To list all of the genres in your library, enter 'list genres'.")
    puts ("To list all of the songs by a particular artist, enter 'list artist'.")
    puts ("To list all of the songs of a particular genre, enter 'list genre'.")
    puts ("To play a song, enter 'play song'.")
    puts ("To quit, type 'exit'.")
    puts ("What would you like to do?")
    
    name = nil
    
    until name == "exit" do
      name = gets
    end
  end
  
  def list_songs
    counter = 1
    @songs.sort_by {|song| song.name}.each do |song|
      puts ("#{counter}. #{song.artist.name} - #{song.name} - #{song.genre.name}")
      counter += 1
    end
  end
  
  def list_artists
    counter = 1
    extracted_artists = @songs.collect {|song| song.artist.name}
    extracted_artists = extracted_artists.sort.uniq
    
    extracted_artists.each do |artist|
      puts ("#{counter}. #{artist}")
      counter += 1
    end
  end
  
  def list_genres
    counter = 1
    extracted_genres = @songs.collect {|song| song.genre.name}
    extracted_genres = extracted_genres.sort.uniq
    
    extracted_genres.each do |genre|
      puts ("#{counter}. #{genre}")
      counter += 1
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist = gets
    
    counter = 1
    @songs.sort_by {|song| song.name}.each do |song|
      if artist == song.artist.name
        puts ("#{counter}. #{song.name} - #{song.genre.name}")
        counter += 1
      end
    end
    
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre = gets
    
    counter = 1
    @songs.sort_by {|song| song.name}.each do |song|
      if genre == song.genre.name
        puts ("#{counter}. #{song.artist.name} - #{song.name}")
        counter += 1
      end
    end
    
  end

end
