require 'pry'
class MusicLibraryController

   def initialize(path = "./db/mp3s")
     #@path = path
     music_importer = MusicImporter.new(path)
     music_importer.import
   end

   def call
     user_input = ""
     while user_input != "exit"
        puts "\n \n"
        puts "Welcome to your music library!\n"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"
        user_input = gets.strip

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
        end #case
      end #while
 end #call

   def list_songs
     #binding.pry
     i=1
     songs_sorted = Song.all.uniq.sort_by(&:name)
     songs_sorted.each do |song|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
      i+=1
     end
   end

   def list_artists
     i=1
     artists_sorted = Artist.all.uniq.sort_by(&:name)
     artists_sorted.each do |artist|
      puts "#{i}. #{artist.name}"
      i+=1
     end
   end

   def list_genres
     i=1
     genres_sorted = Genre.all.uniq.sort_by(&:name)
     genres_sorted.each do |genre|
      puts "#{i}. #{genre.name}"
      i+=1
     end
   end

   def list_songs_by_artist

       puts "Please enter the name of an artist:"
       user_input = gets.strip
       artist = Artist.find_by_name(user_input)
       if artist
         i=1
         artist.songs.sort_by(&:name).each do |song|
            puts "#{i}. #{song.name} - #{song.genre.name}"
            i+=1
         end
       end
   end

   def list_songs_by_genre

       puts "Please enter the name of a genre:"
       user_input = gets.strip
       genre = Genre.find_by_name(user_input)
       if genre
         i=1
         genre.songs.sort_by(&:name).each do |song|
            puts "#{i}. #{song.artist.name} - #{song.name}"
            i+=1
         end
       end
   end

   def play_song
     #binding.pry
     list_songs
     puts "Which song number would you like to play?"

     user_input = gets.strip
     int_input = user_input.to_i
     #binding.pry
     songs_sorted = Song.all.uniq.sort_by(&:name)
     if ((int_input > 0) && (int_input <= songs_sorted.length))
       chosen_song = songs_sorted[int_input-1]
       puts "Playing #{chosen_song.name} by #{chosen_song.artist.name}"
     end
     #binding.pry
   end

end
