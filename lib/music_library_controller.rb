# Upon initialization, accepts an optional path to the library of MP3 files,
# defaulting to ./db/mp3s/. It should then instantiate a MusicImporter object,
# which it will use to import songs from the specified library.
# Has a #call method that starts the CLI and prompts the user for input. Read the tests carefully for specifics.

class MusicLibraryController
  attr_accessor :path

  def initialize(path="./db/mp3s")
    @path = path
    music_path = MusicImporter.new(path)
    music_path.import
  end



  def call
    user_input = ''
    while user_input != 'exit'
      puts "Welcome to your music library!"
      puts "To list all of your songs, enter 'list songs'."
      puts "To list all of the artists in your library, enter 'list artists'."
      puts "To list all of the genres in your library, enter 'list genres'."
      puts "To list all of the songs by a particular artist, enter 'list artist'."
      puts "To list all of the songs of a particular genre, enter 'list genre'."
      puts "To play a song, enter 'play song'."
      puts "To quit, type 'exit'."
      puts "What would you like to do?"
      user_input = gets.strip
    end
  end

  def list_songs
    Song.all.sort_by(&:name).each_with_index {|song, index| puts "#{index+1}. #{song.artist.name} - #{song.name} - #{song.genre.name}" }
  end

  def list_artists
    Artist.all.sort_by(&:name).each_with_index {|artist, index| puts "#{index+1}. #{artist.name}" }
  end

  def list_genres
    Genre.all.sort_by(&:name).each_with_index {|genre, index| puts "#{index+1}. #{genre.name}" }
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    user_input = gets.strip
    if artist = Artist.find_by_name(user_input)
      artist.songs.sort_by(&:name).each_with_index{|song, index| puts "#{index+1}. #{song.name} - #{song.genre.name}"}
    end
  end
end
