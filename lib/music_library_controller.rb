class MusicLibraryController

    def initialize(path = './db/mp3s')
        @path = path
        @music_importer = MusicImporter.new(path)
        @music_importer.import
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
        
        while input != "exit"
            input = gets.strip
            if input == "list songs"
                list_songs
            elsif input == "list artists"
                list_artists
            elsif input == "list genres"
                list_genres
            elsif input == "list artist"
                list_songs_by_artist
            elsif input == "list genre"
                list_songs_by_genre
            elsif input == "play song"
                play_song
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        index = gets.strip
        if index.to_i.is_a?(Integer)
            songs = Song.all.map do |song|
                "#{song.artist.name} - #{song.name} - #{song.genre.name}"
            end
            songs = songs.sort_by {|song| song.split(" - ")[1].to_s}

            if index.to_i > 0 && index.to_i <= songs.length
                puts "Playing #{songs[index.to_i - 1].split(" - ")[1]} by #{songs[index.to_i - 1].split(" - ")[0]}"
            end
        end
    end

    def list_songs
        songs = Song.all.map do |song|
            "#{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
        songs = songs.sort_by {|song| song.split(" - ")[1].to_s}

        count = 0
        songs.each do |song|
            count += 1
            puts "#{count}. #{song}"
        end
    end

    def list_artists
        artists = Artist.all.map do |artist|
            artist.name
        end
        artists = artists.sort
        count = 0
        artists.each do |artist|
            count += 1
            puts "#{count}. #{artist}"
        end
    end

    def list_genres
        genres = Genre.all.map do |genre|
            genre.name
        end
        genres = genres.sort
        count = 0
        genres.each do |genre|
            count += 1
            puts "#{count}. #{genre}"
        end
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist = gets.strip
        if (Artist.find_by_name(artist))
            songs = []
            Song.all.each do |song|
                if song.artist.name == artist
                    songs << song
                end
            end
            songs = songs.sort_by{|song| song.name}
            count = 0
            songs.each do |song|
                count += 1
                puts "#{count}. #{song.name} - #{song.genre.name}"
            end
        end
    end


    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre = gets.strip
        if (Genre.find_by_name(genre))
            songs = []
            Song.all.each do |song|
                if song.genre.name == genre
                    songs << song
                end
            end
            songs = songs.sort_by{|song| song.name}
            count = 0
            songs.each do |song|
                count += 1
                puts "#{count}. #{song.artist.name} - #{song.name}"
            end
        end
    end

end