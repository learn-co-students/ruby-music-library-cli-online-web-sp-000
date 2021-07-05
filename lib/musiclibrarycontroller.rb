class MusicLibraryController 

  
  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import 
  end
  
 def call
    input = " "

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
      if input =="list songs"
        list_songs
      elsif input =="list artists"
        list_artists
      elsif input =="list genres"
        list_genres
      elsif input =="list artist"
        list_songs_by_artist
      elsif input =="list genre"
        list_songs_by_genre
      elsif input =="play song"
        play_song
    end
    end
  end

  def list_songs
    library = Song.all.sort{|a, b| a.name <=> b.name}
    library.each_with_index do |song, number|
      puts "#{number + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    library = Artist.all.sort{|a, b| a.name <=> b.name}
    library.each_with_index do |artist, number|
      puts "#{number + 1}. #{artist.name}"
    end
  end

  def list_genres
    library = Genre.all.sort{|a, b| a.name <=> b.name}
    library.each_with_index do |genre, number|
      puts "#{number + 1}. #{genre.name}"
    end
  end

def list_songs_by_artist
  puts "Please enter the name of an artist:"
  input = gets.strip
  artist_input = Artist.find_by_name(input)
  if artist_input
  library = artist_input.songs.sort{|a, b| a.name <=> b.name}
   library.each_with_index do |song, number|
      puts "#{number + 1}. #{song.name} - #{song.genre.name}"
    end
  end
end
  

def list_songs_by_genre
  puts "Please enter the name of a genre:"
  input = gets.strip
  genre_input = Genre.find_by_name(input)
  if genre_input
  library = genre_input.songs.sort{|a, b| a.name <=> b.name}
   library.each_with_index do |song, number|
      puts "#{number + 1}. #{song.artist.name} - #{song.name}"
    end
  end
end

def play_song 
  puts "Which song number would you like to play?"
  input = gets.strip.to_i
  library = Song.all.sort{|a, b| a.name <=> b.name}
  if input > 0 && input < library.length 
    puts "Playing #{library[input -1].name} by #{library[input -1].artist.name}"
  end
end
  

end