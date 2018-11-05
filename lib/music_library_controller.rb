class MusicLibraryController

    attr_accessor :path

    def initialize(path="./db/mp3s")
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
        
        while (command = gets.strip.downcase) != "exit"
            case
            when command == "list songs"
                list_songs
            when command == "list artists"
                list_artists
            when command == "list genres"
                list_genres
            when command == "list artist"
                list_songs_by_artist
            when command == "list genre"
                list_songs_by_genre
            when command == "play song"
                play_song
            end
        end
    end
    
    def list_songs
        Song.all.sort_by! { |song| song.name}.each_with_index do |song, index|
           puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end
    
    def list_artists
        Artist.all.sort_by! {|artist| artist.name}.each_with_index do |artist, index|
            puts "#{index+1}. #{artist.name}"
        end
    end
    
    def list_genres
        Genre.all.sort_by! {|genre| genre.name}.each_with_index do |genre, index|
            puts "#{index+1}. #{genre.name}"
        end
    end
    
    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        myart = gets.strip
        if myart = Artist.find_by_name(myart)
            myart.songs.sort_by! {|song| song.name}.each_with_index do |song, index|
                puts "#{index+1}. #{song.name} - #{song.genre.name}"
            end
        end
    end
    
    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        mygenr= gets.strip
        if mygenr = Genre.find_by_name(mygenr)
            mygenr.songs.sort_by! {|song| song.name}.each_with_index do |song, index|
                puts "#{index+1}. #{song.artist.name} - #{song.name}"
            end
        end
    end
    
    def play_song
        puts "Which song number would you like to play?"
        mysongnum = gets.strip.to_i
        if mysongnum > 0 && mysongnum <= Song.all.length
            mysong = Song.all.sort_by! {|song| song.name}[mysongnum-1]
            puts "Playing #{mysong.name} by #{mysong.artist.name}" if mysong
        end
    end
end






