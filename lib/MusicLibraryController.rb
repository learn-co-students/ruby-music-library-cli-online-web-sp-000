require 'pry'
class MusicLibraryController
    attr_accessor :path, :songs, :artist, :genre

    def initialize(path = './db/mp3s')
        @path = path
        MusicImporter.new(path).import
    end

    def call
        #binding.pry
        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"

        input = gets.chomp
        case input
            when 'list songs'
                self.list_songs
            when "list artists"
                self.list_artists
            when "list genres"
                self.list_genres
            when "list artist"
                self.list_songs_by_artist
            when "list genre"
                self.list_songs_by_genre
            when "play song"
                self.play_song
            when "exit"
                'exit'
            else
                call
        end
    end

    def list_songs
        #prints all songs in the music library in a numbered list (alphabetized by song name)
        Song.all.sort{|a,b| a.name <=> b.name}.each_with_index do |song, index|
            puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        # prints all artists in the music library in a numbered list (alphabetized by artist name)
        Artist.all.sort{|a,b| a.name <=> b.name}.each_with_index do |artist, index|
            puts "#{index+1}. #{artist.name}"
        end
    end

    def list_genres
        # prints all genres in the music library in a numbered list (alphabetized by genre name)
        Genre.all.sort{|a,b| a.name <=> b.name}.each_with_index do |genre, index|
            puts "#{index+1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        # prompts the user to enter an artist
        puts "Please enter the name of an artist:"
        # accepts user input
        input = gets.chomp
        # prints all songs by a particular artist in a numbered list (alphabetized by song name)
        if artist = Artist.find_by_name(input)
            artist.songs.sort{|a,b| a.name <=> b.name}.each_with_index do |song, index|
                puts "#{index+1}. #{song.name} - #{song.genre.name}"
            end
        end
        # does nothing if no matching artist is found
    end

    def list_songs_by_genre
        # prompts the user to enter a genre
        puts "Please enter the name of a genre:"
        # accepts user input
        input = gets.chomp
        # prints all songs by a particular genre in a numbered list (alphabetized by song name)
        if genre = Genre.find_by_name(input)
            genre.songs.sort{|a,b| a.name <=> b.name}.each_with_index do |song, index|
                puts "#{index+1}. #{song.artist.name} - #{song.name}"
            end
        end
        # does nothing if no matching genre is found
    end

    def play_song
        # prompts the user to choose a song from the alphabetized list output by #list_songs
        puts "Which song number would you like to play?"
        # accepts user input
        input = gets.chomp.to_i
        # checks that the user entered a number between 1 and the total number of songs in the library
        if input > 0 && input <= Song.all.length
            # upon receiving valid input 'plays' the matching song from the alphabetized list output by #list_songs
            # input -1 to account for list starting at 0
            song = Song.all.sort{|a,b| a.name <=> b.name}[input - 1]
            puts "Playing #{song.name} by #{song.artist.name}"
        end
        # does not 'puts' anything out if a matching song is not found
        
    end


end
