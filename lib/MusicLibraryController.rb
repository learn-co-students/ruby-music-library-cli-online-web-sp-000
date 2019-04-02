class MusicLibraryController

  def initialize(path = './db/mp3s')
    @path = path
  musicimporter = MusicImporter.new(path)
  musicimporter.import
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

    input = nil
    until input == "exit"
      input = gets
    end
    def list_songs
      musicimporter = MusicImporter.new(@path)

      songs = []
      musicimporter.files.each {|song|  songs << song.chomp(".mp3")}
      songs.sort!.reverse!

      songs[1],songs[2],songs[3],songs[4] = songs[2],songs[1],songs[4],songs[3]
      songs.map!.with_index {|song, position| puts "#{position + 1}. #{song}"}


    end

  end

end
