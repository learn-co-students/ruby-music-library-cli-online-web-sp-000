class MusicLibraryController
    def initialize(path = './db/mp3s')
        MusicImporter.new(path).import
    end

    def call
        input = ""
        while input != 'exit'
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
        if input == "list songs"
            list_songs
        end
        if input == 'list artists'
            list_artists
        end
        if input == 'list genres'
            list_genres
        end
        if input == 'list artist'
            list_songs_by_artist
        end
        if input == 'list genre'
            list_songs_by_genre
        end
        if input == 'play song'
            play_song
        end
    end
    end

    def list_songs
        song_list = Song.all.uniq.sort {|a,b|a.name<=>b.name}
        song_list.collect.with_index do |song, index|
            puts "#{index += 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
        end
    end

    def list_artists 
        artist_list = Artist.all.uniq.sort{|a,b|a.name <=> b.name}
        artist_list.collect.with_index do |artist, index|
            puts "#{index += 1}. #{artist.name}" 
        end
    end

    def list_genres 
        genre_list = Genre.all.uniq.sort {|a,b|a.name <=> b.name}
        genre_list.collect.with_index do |genre, index|
            puts "#{index += 1}. #{genre.name}"
        end
    end

    def list_songs_by_artist
        #input = ""
        puts "Please enter the name of an artist:"
        input = gets.strip
        if Artist.find_by_name(input)
            artist = Artist.find_by_name(input)
            song_list = artist.songs.uniq.sort {|a,b|a.name <=> b.name}
            song_list.collect.with_index do |song, i|
                puts "#{i += 1}. #{song.name} - #{song.genre.name}"
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        input = gets.strip
        if Genre.find_by_name(input)
            genre = Genre.find_by_name(input)
            genres = genre.songs.uniq.sort {|a,b|a.name <=> b.name}
            genres.collect.with_index do |song, i|
                puts "#{i+=1}. #{song.artist.name} - #{song.name}"
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        input = gets.strip.to_i
        song_list = Song.all.uniq.sort {|a,b|a.name<=>b.name}
        song = song_list[input-=1]
        if song && input >= 0 && input <= song_list.size
            puts "Playing #{song.name} by #{song.artist.name}"
        end
    end
end