require 'pry'
require_relative "../config/environment.rb"

class MusicLibraryController

    def initialize(path = "./db/mp3s")
        @path = path
        @importer = MusicImporter.new(@path)
        @importer.import
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

        @input = gets.strip
        while @input != "exit"
            puts "To quit, type 'exit'"
            @input = gets.strip
        end

    end

    def list_songs  
        by_songs = @importer.files.collect {|song| song.split(/[.-]/)}
        no_mp3 = by_songs.each {|song| song.pop}
        sorted = no_mp3.sort {|a, b| a[1] <=> b[1]}
        sorted.each_with_index {|song, index| puts "#{index + 1}. #{song.join("-")}"}
    end

    def list_artists
        artists = Artist.all.collect {|artist| artist.name}
        sorted = artists.uniq.sort
        sorted.each_with_index {|artist, index| puts "#{index + 1}. #{artist}"}
    end

    def list_genres
        genres = Genre.all.collect {|genre| genre.name}
        sorted = genres.uniq.sort
        sorted.each_with_index {|genre, index| puts "#{index + 1}. #{genre}"}
    end

    def list_songs_by_artist
        puts "Please enter the name of an artist:"
        answer = gets.strip
        if artist = Artist.find_by_name(answer)
            songs = artist.songs.sort_by {|songs| songs.name}
            song_names = songs.collect {|song| song.name}
 
            genre = songs.collect {|song| song.genre}
            genre_names = genre.collect {|genre| genre.name}
 
            i = 0
            while i < song_names.length do
                puts "#{i + 1}. #{song_names[i]} - #{genre_names[i]}"
                i += 1
            end
        end
    end

    def list_songs_by_genre
        puts "Please enter the name of a genre:"
        answer = gets.strip
        if genre = Genre.find_by_name(answer)
            songs = genre.songs.sort_by {|songs| songs.name}
            song_names = songs.collect {|song| song.name}

            artist = songs.collect {|song| song.artist}
            artist_names = artist.collect {|artist| artist.name}

            i = 0
            while i < song_names.length do
                puts "#{i + 1}. #{artist_names[i]} - #{song_names[i]}"
                i += 1
            end
        end
    end

    def play_song
        puts "Which song number would you like to play?"
        answer = gets.strip.to_i
        if answer < Song.all.length
            song_array = Song.all.sort_by {|song| song.name} 
            song_array.uniq
            song = song_array[answer - 1]
            puts "Playing #{song.name} by #{song.artist.name}"
            binding.pry
        end
    end


end