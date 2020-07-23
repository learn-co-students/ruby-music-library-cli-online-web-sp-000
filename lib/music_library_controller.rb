require "pry"

class MusicLibraryController

  def initialize(path = "./db/mp3s")
    new_importer_object = MusicImporter.new(path)
    new_importer_object.import
  end

  def group_objects
    list_artists = []
    list_genres = []
    list_songs = []
    Song.all.each_with_index do |item, index|
      case Song.all[index].class
      when Artist
          list_artists << Song.all[index]
      when Genre
          list_genres << Song.all[index]
      when Song
          list_songs << Song.all[index]
      end
    end
  end

  def list_songs
   Song.all.sort{|a, b| a.name <=> b.name}.each_with_index do |s, i|
     puts "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
   end
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
  end
  end
end
