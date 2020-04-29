require 'pry'
class MusicLibraryController
    
    attr_reader :path

    def initialize(path="./db/mp3s")
        @path = path
        MusicImporter.new(path).import
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
        Song.all.sort_by{|s| s.name}.each.with_index do |x, i|
            puts "#{i+1}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
        end
    end

    def list_artists
        sorted_artists = Artist.all.sort_by { |a| a.name }
        sorted_artists.each_with_index { |a, index| puts "#{index+1}. #{a.name}" }
    end
      
    def list_genres
        sorted_genres = Genre.all.sort_by { |g| g.name }
        sorted_genres.each_with_index { |g, index| puts "#{index+1}. #{g.name}" }
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_name = gets.strip
        artist = Artist.find_or_create_by_name(artist_name)
        artist_songs = artist.songs.sort_by {|s| s.name}
        artist_songs.each_with_index { |s, i| puts "#{i+1}. #{s.name} - #{s.genre.name}" }
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_name = gets.strip
        genre = Genre.find_or_create_by_name(genre_name)
        genre_songs = genre.songs.sort_by {|s| s.name}
        genre_songs.each_with_index { |s, i| puts "#{i+1}. #{s.artist.name} - #{s.name}" }
    end

    def play_song
        puts "Which song number would you like to play?"
        song_number = gets.strip.to_i
        if (1..Song.all.length).include?(song_number)
            song = Song.all.sort_by{|x| x.name}[song_number+2]
            puts "Playing #{song.name} by #{song.artist.name}"  
        elsif !(1..Song.all.length).include?(song_number)
            nil
        end
    end
end

