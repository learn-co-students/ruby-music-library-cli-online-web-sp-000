class MusicLibraryController

    attr_accessor :path
    extend Concerns::Findable

    def initialize(path='./db/mp3s')
        @path = path
        new_import = MusicImporter.new(path)
        new_import.import
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


        input = ""
        until input == "exit"
            input = gets.chomp
            case input
            when "list songs"
                self.list_songs
            when "list artists" 
                self.list_artists
            when "list genres"
                self.list_genres
            when "play song"
                self.play_song
            when "list artist"
                self.list_songs_by_artist
            when "list genre"
                self.list_songs_by_genre
            end    
        end
    end

    def ask_input
        ask_input = gets
    end
    
    def list_songs
        song_list = Song.all.sort {|song1, song2| song1.name <=> song2.name}
        counter = 0
        song_list.each do |song|
            puts "#{counter+=1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists
        artist_list = Artist.all.sort {|artist1, artist2| artist1.name <=> artist2.name}
        counter = 0
        artist_list.each do |artist|
            puts "#{counter+=1}. #{artist.name}"
        end
    end

    def list_genres
        genre_list = Genre.all.sort {|genre1, genre2| genre1.name <=> genre2.name}
        counter = 0
        genre_list.each do |genre|
            puts "#{counter+=1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        puts("Please enter the name of an artist:")
        ask_artist = self.ask_input
        counter = 0
        songs = []
        
        Song.all.each do |song |
            if (song.artist.name == ask_artist)
                songs << song
            end
        end

        sorted_songs = songs.sort {|song1, song2| song1.name <=> song2.name}

        sorted_songs.each do |song|
            puts "#{counter+=1}. #{song.name} - #{song.genre.name}"
        end
    end

    def list_songs_by_genre
        puts("Please enter the name of a genre:")
        ask_genre = self.ask_input
        counter = 0
        songs = []
        
        Song.all.each do |song|
            if (song.genre.name == ask_genre)
                songs << song
            end
        end

        sorted_songs = songs.sort {|song1, song2| song1.name <=> song2.name}

        sorted_songs.each do |song|
            puts "#{counter+=1}. #{song.artist.name} - #{song.name}"
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        ask_song = gets.chomp.to_i
        song_list = Song.all.sort {|song1, song2| song1.name <=> song2.name}
        selected_song = song_list[ask_song-1]

        if (ask_song >= 1 && ask_song <= song_list.length)
            puts "Playing #{selected_song.name} by #{selected_song.artist.name}"
        end
    end

    
end
