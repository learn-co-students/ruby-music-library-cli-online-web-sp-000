require "pry"

class MusicLibraryController
  attr_accessor :path
  attr_reader :music

  def initialize(path = "./db/mp3s")
    @music = MusicImporter.new(path)
    # binding.pry
    @music.import

  end

  def call
    input = nil

    while input != "exit" do
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
    end
  end

  def list_songs
    Song.all.sort{|a,b| a.name <=> b.name}.each.with_index(1) do |song, i|
      puts "#{i}. #{song.artist.name} - #{song.name} - #{song.genre.name}"
    end
  end

  def list_artists
    # Song.all.uniq{|a| a.artist.name}.sort{|a,b| a.artist.name <=> b.artist.name}.each.with_index(1) do |file, i|
    #   puts "#{i}. #{file.artist.name}"
    # end    !!!!! LEAVING BEHIND FOR REFERENCE

    Artist.all.sort{|artist,b| artist.name <=> b.name}.each.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  def artist_list
    Artist.all.sort{|artist,b| artist.name <=> b.name}.collect.with_index(1) do |artist, i|
      puts "#{i}. #{artist.name}"
    end
  end

  def list_genres
    Genre.all.sort{|genre, b| genre.name <=> b.name}.each.with_index(1) do |genre, i|
      puts "#{i}. #{genre.name}"
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    artist_name = gets.strip

    Artist.all.find do |artist|
      if artist.name == artist_name

        artist.songs.sort{|song, b| song.name <=> b.name}.each.with_index(1) do |song, i|
          puts "#{i}. #{song.name} - #{song.genre.name}"
        end
      end
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    genre_name = gets.strip

    Genre.all.find do |genre|
      if genre.name == genre_name
        genre.songs.sort{|song, b| song.name <=> b.name}.each.with_index(1) do |song, i|
          puts "#{i}. #{song.artist.name} - #{song.name}"
        end
      end
    end
  end

 def play_song
    puts "Which song number would you like to play?"
    num = gets.strip.to_i
      if (1..Song.all.length).include?(num)
        song = Song.all.sort{|a,b| a.name <=> b.name}[num -1]
        puts "Playing #{song.name} by #{song.artist.name}"
      end
  end

end
