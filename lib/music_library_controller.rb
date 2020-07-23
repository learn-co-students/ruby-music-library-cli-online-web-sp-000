class MusicLibraryController
 
  def initialize(path = './db/mp3s')
    
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
    while (user_input = gets.chomp.downcase) != "exit"
      case
      when user_input == "list songs"
        list_songs
      when user_input == "list artists"
        list_artists
      when user_input == "list genres"
        list_genres
      when user_input == "list artist"
        list_songs_by_artist
      when user_input == "list genre"
        list_songs_by_genre
      when user_input == "play song"
        play_song
      end
    end
  end
  
  def list_songs
    ordered_songs = Song.all.uniq.sort_by {|song| song.name} 
      ordered_songs.each do |song| 
       number = ordered_songs.index(song) + 1 
        puts "#{number}. #{song.artist.name} - #{song.name} - #{song.genre.name}" 
    end 
  end 
 
def list_artists  
 artists_sorted_by_name = Artist.all.sort_by do |artist|
    artist.name
  end
  artists_sorted_by_name.each.with_index(1) do |artist,index|
    puts "#{index}. #{artist.name}"
  end 
end 
  
  
def list_genres 
   genres_sorted_by_name = Genre.all.sort_by do |genre|
      genre.name
    end
    genres_sorted_by_name.each.with_index(1) do |genre,index|
    puts "#{index}. #{genre.name}"
  end 
end 
  
def list_songs_by_artist
  puts "Please enter the name of an artist:"
  input = gets.strip
  
  if artist = Artist.find_by_name(input)
    artist.songs.sort_by(&:name).each.with_index(1) do |song, index|
      puts "#{index}. #{song.name} - #{song.genre.name}"
    end 
  end 
  
end 

  
  def list_songs_by_genre
  puts "Please enter the name of a genre:"
  input = gets.strip
  
  if genre = Genre.find_by_name(input)
    genre.songs.sort_by(&:name).each.with_index(1) do |song, index|
      puts "#{index}. #{song.artist.name} - #{song.name}"
    end 
  end 
  
end 
  
  
  
  
def play_song
    puts "Which song number would you like to play?"
    input = gets.chomp.to_i

    # self.list_songs
    songs = Song.all.uniq
    # songs.sort {|a,b| a.name <=> b.name}
 
 
    if (1..songs.length).include?(input)
      song = Song.all.sort{ |a, b| a.name <=> b.name }[input +2]
        
    end
    # binding.pry

    puts "Playing #{song.name} by #{song.artist.name}" if song
  end

end 
