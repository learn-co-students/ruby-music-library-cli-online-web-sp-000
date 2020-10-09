class MusicLibraryController
  attr_accessor :path

  def initialize(path = "./db/mp3s")
    new_import = MusicImporter.new(path)
    new_import.import
  end

  def call
     input = gets.strip

     if input != exit

       puts "Welcome to your music library!"
       puts "To list all of your songs, enter 'list songs'."
       puts "To list all of the artists in your library, enter 'list artists'."
       puts "To list all of the genres in your library, enter 'list genres'."
       puts "To list all of the songs by a particular artist, enter 'list artist'."
       puts "To list all of the songs by a particular genre, enter 'list genre'."
       puts "To play a song, enter 'play song'."
       puts "To quit, enter 'exit'."
       puts "What would you like to do?"

       if input == "list songs"
         list_songs
       elsif input == "list artists"
         list_artists
       elsif input == "list genres"
         list_genres
       elsif input == "list artist"
         list_artists
       elsif input == "list genre"
         list_genres
       elsif input == "play song"
         play_song
        end
       end
     end
   end


   def list_songs
     Song.all.sort{|a, b|
       a.name <=> b.name}.each_with_index do |s, i|
       puts "#{i+1}. #{s.name} - #{s.artist.name} - #{s.genre.name}"
   end

   def list_artists
     Artist.all.sort {|a, b|
       a.name <=> b.name}.each_with_index do |a, i|
       puts "#{i+1}. #{a.name}"
   end

   def list_genres
     Genre.all.sort{|a, b|
       a.name <=> b.name}.each_with_index do |g, i|
       puts "#{i+1}. #{g.name}"
   end

   def list_artist
     input = gets.strip
     puts "Please enter an artist."

     if artist == Artist.find_by_name(input)
       artists.songs.sort do |a, b|
         a.name <=> b.name.each_with_index do |s, i|
           puts "#{i+1}. #{s.name} - #{s.genre.name}"
         end
       end
     end


   def list_genre
     input = gets.strip
     puts "Please enter a genre."

     if genre == Genre.find_by_name(input)
       genre.songs.sort do |a, b|
         a.name <=> b.name.each_with_index do |s, i|
           puts "#{i+1}. #{s.name} - #{s.artist.name}"
         end
       end
   end

   def play_song
     puts "Please enter the number of the song you would like to play."
     list_songs
     input = gets.strip.to_i
     if input > 0 && input <= Song.all.length
       song_list = Song.all.sort do |a, b|
         a.name <=> b.name
         song = songlist[input-1]
         puts "Now playing #{song.name} by #{song.artist.name}"
       end
     end
   end
 end


end
end
end
end
