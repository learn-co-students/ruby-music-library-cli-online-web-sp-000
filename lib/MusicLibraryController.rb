class MusicLibraryController
  
    def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end
  
  
  def call 
    input = ''

    while input != 'exit'
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
      
      case input
      when 'list songs'
        self.list_songs
      when 'list artists'
        self.list_artists
      when 'list genres'
        self.list_genres
      when 'list artists'
        self.list_artists
      when 'list artist'
        self.list_songs_by_artist
      when 'list genre'
        self.list_songs_by_genre
      when 'play song'
        self.play_song
      else
        "Type in a valid request please"
      end

    end 


  end 
  
  
  def list_songs 
    x = Song.all.sort_by{|song|song.name}
    x.each_with_index do |song, i|
    i+=1
    puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
  end 
  x
  end 
  
  def list_artists
    x = Artist.all.sort_by{|artist|artist.name}
    x.each_with_index do |artist, i|
    i+=1
    puts "#{i}. #{artist.name}"
  end
  
end 

 def list_genres
    x = Genre.all.sort_by{|genre|genre.name}
    x.each_with_index do |genre, i|
    i+=1
    puts "#{i}. #{genre.name}"
  end
end 


  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
    
    if x = Artist.find_by_name(input) 
    
    sorted_artist = x.songs.sort_by{|song|song.name}
    
    sorted_artist.each_with_index do |song,i| 
      i+=1 
      puts "#{i}. #{song.name} - #{song.genre.name}"
    end
    
  end 

  
  
  
end 





  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip

    if genre = Genre.find_by_name(input)
      genre.songs.sort { |a,b| a.name <=> b.name }.each.with_index(1) do |song, i|
        puts "#{i}. #{song.artist.name} - #{song.name}"
      end
    end
  end


def play_song 
  puts "Which song number would you like to play?"
  input = gets.chomp.to_i
  
  if input > 0 && input <= Song.all.length
  song = Song.all.sort{ |a, b| a.name <=> b.name }[input - 1]
  puts "Playing #{song.name} by #{song.artist.name}"
  end 
  
  
end 


end 