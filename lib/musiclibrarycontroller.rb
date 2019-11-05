require "pry"
class MusicLibraryController
  attr_accessor :path
  def initialize(path = "./db/mp3s")
    @path = path
    MusicImporter.new(path).import

  end

  def call
    input = ""
    while input != "exit"
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    input = gets
    end
  end

  def list_songs
    song_list = Song.all.sort{|a, b| a.name <=> b.name}.uniq
    songs = []
    song_list.each_with_index{|song, index|
      songs << song
      puts "#{index + 1}. #{song.artist.name} - #{song.name} - #{song.genre.name}"}
      songs
  end

  def list_artists
    artist_list = Artist.all.sort{|a, b| a.name <=> b.name}.uniq
    artist_list.each_with_index{|artist, index|

      puts "#{index + 1}. #{artist.name}"}

  end
  #
  def list_genres
    genre_list = Genre.all.sort{|a, b| a.name <=> b.name}.uniq
    genre_list.each_with_index{|genre, index|

      puts "#{index + 1}. #{genre.name}"}
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"

    input = gets

    artist = Artist.find_by_name(input)
    if artist == nil
    else
      artist_song_list = Artist.find_by_name(input).songs.sort{|a, b| a.name <=> b.name}

        artist_song_list.each_with_index{|song, index|
          puts "#{index + 1}. #{song.name} - #{song.genre.name}"
            }
      end
  end

    def list_songs_by_genre
      puts "Please enter the name of a genre:"

      input = gets

      genre = Genre.find_by_name(input)
      if genre == nil
      else
        genre_song_list = Genre.find_by_name(input).songs.sort{|a, b| a.name <=> b.name}

          genre_song_list.each_with_index{|song, index|
            puts "#{index + 1}. #{song.artist.name} - #{song.name}"
              }
        end
  end
    def play_song


      puts "Which song number would you like to play?"

      input = gets.strip
      # binding.pry
      songs = Song.all.sort{|a, b| a.name <=> b.name}.uniq
      # binding.pry
      input = input.to_i
      if (1..songs.length).include?(input)
        song = songs[input - 1]
        puts "Playing #{song.name} by #{song.artist.name}"


      end

    end
end
