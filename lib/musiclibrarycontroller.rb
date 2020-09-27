require "pry"

class MusicLibraryController 


    def initialize(path = "./db/mp3s")
        @path = path
       importer  = MusicImporter.new(path)
       importer.import
end

def call
    input = "" 
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
    end
end
    def list_songs  
        sorted_songs = Song.all.sort{ |a,b| a.name <=> b.name}
        sorted_songs.each_with_index do |song, index|
        puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        
        end
    end  
    
    def list_artists
        sorted_artists = Artist.all.sort{ |a,b| a.name <=> b.name}
        sorted_artists.each_with_index do |artist, index|
        puts "#{index+1}. #{artist.name}"

    end
end


def list_genres
        sorted_genres = Genre.all.sort{ |a,b| a.name <=> b.name}
        sorted_genres.each_with_index do |genre, index|
        puts "#{index+1}. #{genre.name}"
        end
    end
def list_songs_by_artist
    input = ""
    sorted_artist_songs = Artist.songs.sort{ |a,b| a.name <=> b.name}
        sorted_artist_songs.each_with_index do |song, index|
    puts "Please enter the name of an artist:"
    puts "#{index+1}. #{song.name} - #{song.genre}"
    input = gets.strip
    end
end
end