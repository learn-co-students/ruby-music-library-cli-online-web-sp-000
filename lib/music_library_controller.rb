class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    @path = path
    importer = MusicImporter.new(@path)
    importer.import
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
    
    input = gets
    
    while input != "exit"
      case input
      when "list songs"
        self.list_songs
      when "list artists"
        self.list_artists
      when "list genres"
        self.list_genres
      when "list artist"
        self.list_songs_by_artist
      when "list genre"
        self.list_songs_by_genre
      when "play song"
        self.play_song
      end
      input = gets
    end
    
  end
  
  def list_songs
    songs = Song.all
    songs.sort_by! { |song| [ song.name ] }
    songs.each_with_index do |song, index|
      puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
    songs
  end
  
  def list_artists
    artists = Artist.all
    artists.sort_by! { |artist| [ artist.name ] }
    artists.each_with_index do |artist, index|
      puts "#{index+1}. #{artist.name}"
    end
  end
  
  def list_genres
    genres = Genre.all
    genres.sort_by! { |genre| [ genre.name ] }
    genres.each_with_index do |genre, index|
      puts "#{index+1}. #{genre.name}"
    end
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets
    artist = Artist.all.find {|artist| artist.name == input}
    if artist != nil 
      songs = artist.songs.sort_by { |song| [song.name] }
      songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
      end 
    end
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets
    genre = Genre.all.find {|genre| genre.name == input}
    if genre != nil 
      songs = genre.songs.sort_by { |song| [song.name] }
      songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name}"
      end 
    end
  end
  
  def play_song
    songs = Song.all
    songs.sort_by! { |song| [ song.name ] }#self.list_songs
    puts "Which song number would you like to play?"
    input = gets
    num = input.to_i
    if num >= 1 && num <= songs.size 
      puts "Playing #{songs[num-1].name} by #{songs[num-1].artist.name}"
    end
  end
  
end



   