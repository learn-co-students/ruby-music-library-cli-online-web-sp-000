class MusicLibraryController
    def initialize(path = "./db/mp3s")
        importer = MusicImporter.new(path)
        importer.import
    end
    
    def input
        user_input = ""
        # until user_input != "" do
        #     user_input = gets.strip
        #     sleep(1.2)
        # end
        loop do
            # sleep(0.5)
            user_input = gets.strip
            break if user_input != ""
        end

        user_input

    end

    def call
        selection = ""

        puts "Welcome to your music library!"
        puts "To list all of your songs, enter 'list songs'."
        puts "To list all of the artists in your library, enter 'list artists'."
        puts "To list all of the genres in your library, enter 'list genres'."
        puts "To list all of the songs by a particular artist, enter 'list artist'."
        puts "To list all of the songs of a particular genre, enter 'list genre'."
        puts "To play a song, enter 'play song'."
        puts "To quit, type 'exit'."
        puts "What would you like to do?"

        selection = input

        if selection != "exit"
            case selection
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
            else
                call
            end
        end

        # self.send("#{command}") unless command == "exit"
    end

    def list_songs
        Song.all.sort{ | a, b| a.name <=> b.name }.each_with_index{ |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

    def list_artists
        Artist.all.sort{ | a, b| a.name <=> b.name }.each_with_index{ |artist, index| puts "#{index + 1}. #{artist.name}"}
    end

    def list_genres
        Genre.all.sort{ | a, b| a.name <=> b.name }.each_with_index{ |genre, index| puts "#{index + 1}. #{genre.name}"}
    end

    def list_songs_by_artist
        songs = []
        puts "Please enter the name of an artist:"
        artist = Artist.find_by_name(input)
        if artist
            artist.songs.each{|song| songs << song }
            sorted = songs.sort{| a, b | a.name <=> b.name}
            sorted.each_with_index{ |song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
        end
    end

    def list_songs_by_genre
        # puts "\n\n"
        # list_genres
        # puts "\n"
        puts "Please enter the name of a genre:"
        genre = input
        Genre.find_by_name(genre).songs.sort{ | a,b | a.name <=> b.name }.each_with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"} if Genre.find_by_name(genre)
        # if Genre.find_by_name(genre)
        #     # songs = Song.all.select{|song| song.genre.name == genre}
        #     Genre.find_by_name(genre).songs.sort{ | a,b | a.name <=> b.name }.each_with_index{|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
        # # else
        # #     list_songs_by_genre
        # end
    end

    def play_song
        # list_songs
        puts "Which song number would you like to play?"

        selection = input
        choice = selection.to_i - 1

        choices = Song.all.sort{ | a, b | a.name <=> b.name }
        if ( choice >= 0 ) && ( choice <= choices.size - 1 )
            # choice = selection
            chosen_song = choices[choice]
            if chosen_song.is_a?(Song)
                puts "Playing #{chosen_song.name} by #{chosen_song.artist.name}"
            else
                puts "Playing nothing by no such aritst <Song = <#{chosen_song}>>"
            end
        # else
        #     play_song
        end
    end
end
