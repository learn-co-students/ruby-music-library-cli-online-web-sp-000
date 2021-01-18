class MusicLibraryController
  attr_reader :path, :songs
  
  def initialize(path = './db/mp3s')
    @path = path
    MusicImporter.new(@path).import
  end
  
  def call
     input = gets.strip

     if input != exit

     puts "Welcome to your music library!"
     puts "To list all of your songs, enter 'list songs'."
     puts "To list all of the artists in your library, enter 'list artists'."
     puts "To list all of the genres in your library, enter 'list genres'."
     puts "To list all of the songs by a particular artist, enter 'list artist'."
     puts "To list all of the songs of a particular genre, enter 'list genre'."
     puts "To play a song, enter 'play song'."
     puts "To quit, type 'exit'."
     puts "What would you like to do?"

     case input
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
         end
     end
   end
  
  def list_songs 
    Song.all.sort{|a,b| a.name <=> b.name}.each_with_index{|song,i| puts"#{i+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
  end
  
  def list_artists 
    Artist.all.sort{|a,b| a.name <=> b.name}.each_with_index{|artist,i| puts "#{i+1}. #{artist.name}"}
  end
  
  def list_genres
    Genre.all.sort{|a,b| a.name <=> b.name}.each_with_index{|genre,i| puts "#{i+1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    input = gets.strip
      genres_songs = Song.all.select{|song| song.artist.name == input}
      sorted = genres_songs.sort{|a,b| a.name <=> b.name}
      sorted.each_with_index{|song, i| puts "#{i+1}. #{song.name} - #{song.genre.name}"}
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    input = gets.strip
      genres_songs = Song.all.select{|song| song.genre.name == input}
      sorted = genres_songs.sort{|a,b| a.name <=> b.name}
      sorted.each_with_index{|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name}"}
  end
  
  def play_song
    puts "Which song number would you like to play?"
    input = gets.strip.to_i
    if input > 0 && input <= Song.all.length
      array = Song.all.sort{|a, b| a.name <=> b.name}
      song = array[input-1]
      puts "Playing #{song.name} by #{song.artist.name}"
    end
  end

  
end
  
# #method to format filenames in #list_songs #list_artists

# def format_file(filename)
#     file_array = filename.split('-')
#     artist = file_array[0].strip
#     song = file_array[1].strip
#     genre = file_array[2].split('.')[0].strip
#     genre == "hip" ? genre = "hip-hop" : nil
#     formatted_filename = [artist, song, genre]
#   end
  
#   def list_songs
#     list = []
#     songs = []
    
# #get songs into an array and sort them alphabetically
#     @files.each_with_index do |filename, i|
#     formatted_filename = format_file(filename)
#     song = formatted_filename[1]
#     songs << song
#     songs = songs.sort
#     end 

# #uses ordered song list to find files
#     @files.each do |filename|
#       songs.each_with_index do |song, i|
#       if filename.include?(song)
#         formatted_filename = format_file(filename)
#         list[i] ="#{i+1}. #{formatted_filename[0]} - #{formatted_filename[1]} - #{formatted_filename[2]}"
#         end
#       end
#     end 
#     list.each{|song_info| puts song_info}
#   end
  
#   #try puting artists and songs arrays as class variables, and have them update when MusicLibraryController initializes
#   def list_artists 
#     list = []
#     artists = []
    
#     @files.each_with_index do |filename, i|
#       formatted_filename = format_file(filename)
#       artist = formatted_filename[0]
#       artists << artist
#       artists = artists.sort.uniq
#     end 
#     artists.each_with_index do |artist, i|
#       if !list.include?(artist)
#       list << artists[i] = "#{i+1}. #{artist}"
#       else
#       list.delete(artist)
#       end
#     end
#     # binding.pry 
#     list.each{|artist| puts artist}
#   end
  
# end