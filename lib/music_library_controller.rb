require "pry"

class MusicLibraryController

  # attr_accessor :path
  attr_reader :importer

  def initialize(path = "./db/mp3s")
    @importer = MusicImporter.new(path)
    @importer.import
  end

 def list_songs
  Song.all_sorted.each_with_index {|s,i|
    puts "#{i+1}. #{s.filename.chomp('.mp3')}"
  }
 end

 def list_artists
   Artist.all_sorted.each_with_index {|s,i| puts "#{i+1}. #{s.name}"}
 end

 def list_genres
   Genre.all_sorted.each_with_index {|s,i| puts "#{i+1}. #{s.name}"}
 end

 def list_songs_by_artist
   puts "Please enter the name of an artist:"
   name = gets
   Song.all_sorted.select { |song| song.artist.name == name }
     .each_with_index { |s,i| puts "#{i+1}. #{s.name} - #{s.genre.name}" }
 end

 def list_songs_by_genre
   puts "Please enter the name of a genre:"
   name = gets
   Song.all_sorted.select { |song| song.genre.name == name }
     .each_with_index { |s,i| puts "#{i+1}. #{s.artist.name} - #{s.name}" }
 end

 def play_song
   puts "Which song number would you like to play?"
  #  list_songs
   num = gets.to_i
   return if num > Song.all.count || num < 1
   s = Song.all_sorted[num - 1]
   puts "Playing #{s.name} by #{s.artist.name}" unless !s
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
   input = nil
   while input != "exit"
     input = gets
     case input
     when 'list songs'; list_songs
     when 'list artists'; list_artists
     when 'list genres'; list_genres
     when 'list artist'; list_songs_by_artist
     when 'list genre'; list_songs_by_genre
     when 'play song'; play_song
     end
   end
 end

end
