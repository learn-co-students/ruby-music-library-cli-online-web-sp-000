class MusicLibraryController

    def initialize(path='./db/mp3s')
        new_controller = MusicImporter.new(path)
        new_controller.import
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

        user_input = gets

        if user_input != "exit"
            call
        end

        case user_input
        when 'list songs'
            list_songs
        when 'list artists'
            list_artists
        when 'list genres'
            list_genres
        when 'list artist'
            list_songs_by_artist
        when 'list genre'
            list_songs_by_genre
        when 'play song'
            play_song
        end
    end



    def list_songs
        song_list = Song.all.sort_by(&:name)
        song_list.each_with_index {|song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
    end

    def list_artists
        Artist.all.sort_by(&:name).each_with_index {|artist, index| puts "#{index + 1}. #{artist.name}"}
    end

    def list_genres
        Genre.all.sort_by(&:name).each_with_index {|genre, index| puts "#{index + 1}. #{genre.name}"}
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        artist_input = gets

        song_list = Song.all.find_all { |song| song.artist.name == artist_input}
        song_list.sort_by(&:name).each_with_index { |song, index| puts "#{index + 1}. #{song.name} - #{song.genre.name}"}
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        genre_input = gets

        song_list = Song.all.find_all { |song| song.genre.name == genre_input}
        song_list.sort_by(&:name).each_with_index { |song, index| puts "#{index + 1}. #{song.artist.name} - #{song.name}"}
    end

    def play_song
        puts "Which song number would you like to play?"
        song_input = gets
        song_input = song_input.to_i
        if song_input > 0 and song_input <= Song.all.length
            puts "Playing #{Song.all[song_input].name} by #{Song.all[song_input].artist.name}"
        end
    end
end