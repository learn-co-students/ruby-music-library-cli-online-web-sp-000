class MusicLibraryController
  
  def initialize(path="./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import 
  end
  
  def list_songs
    songs = Song.all
    songs.sort {|s1, s2| s1.name <=> s2.name}.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists
    Artist.all.sort {|a1, a2| a1.name <=> a2.name}.each_with_index {|artist, i| puts "#{i+1}. #{artist.name}"}
  end
  
  def list_genres
    Genre.all.sort {|g1, g2| g1.name <=> g2.name}.each_with_index {|genre, i| puts "#{i+1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets.strip
    artist = Artist.find_by_name(name)
    artist.songs.sort {|s1, s2| s1.name <=> s2.name}.each_with_index {|song, i| puts "#{i+1}. #{song.name} - #{song.genre.name}"} if artist
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name = gets.strip
    genre = Genre.find_by_name(name)
    genre.songs.sort {|s1, s2| s1.name <=> s2.name}.each_with_index {|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name}"} if genre
  end
  
  def play_song
    puts "Which song number would you like to play?"
    number = gets.strip.to_i
    songs = Song.all.sort {|s1, s2| s1.name <=> s2.name}
    if number.between?(1, songs.count)
      puts "Playing #{songs[number-1].name} by #{songs[number-1].artist.name}" if songs[number-1]
    end
  end
  
  def call
    puts 'Welcome to your music library!'
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    user_input = gets.strip
    until user_input == 'exit' do
      list_songs if user_input == 'list songs'
      list_artists if user_input == 'list artists'
      list_genres if user_input == 'list genres'
      list_songs_by_artist if user_input == 'list artist'
      list_songs_by_genre if user_input == 'list genre'
      play_song if user_input == 'play song'
      user_input = gets.strip
    end
    
  end
  
end