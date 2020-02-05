class MusicLibraryController


    def initialize(path = "./db/mp3s")
        # MusicLibraryController #initialize creates 
        # a new MusicImporter object, passing in the 'path' value
        @path = path 
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
        gets.chomp
        
        gets.chomp until gets.chomp == "exit"

    end

    def list_songs
        # Prints all the songs in the music library in numbered order
        # Where is the music library
        Song.all
        binding.pry
        # I want to get rid of a string using GSUB
    end

end 