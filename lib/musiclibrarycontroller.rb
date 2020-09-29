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

def     list_songs_by_artist
        puts "Please enter the name of an artist:"
        input = gets.strip   
        if artist = Artist.find_by_name(input)  
        sorted_artist = artist.songs.sort{ |a,b| a.name <=> b.name}
        sorted_artist.each_with_index do |song, index|
     #       binding.pry
        puts "#{index+1}. #{song.name} - #{song.genre.name}"
        end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        if genre = Genre.find_by_name(input)
            sorted_genre = genre.songs.sort{|a,b| a.name <=> b.name}
            sorted_genre.each_with_index do |song, index|

            puts "#{index+1}. #{song.artist.name} - #{song.name}"


            end
    end
end


def play_song
        puts "Which song number would you like to play?"
        input = gets.strip.to_i
        if song = Song.all.count > input && input > 0
         song = Song.all.each_with_index{|song, index| song.index == input}
        puts "Playing #{song.name} by #{index}"
        end
      end
    end