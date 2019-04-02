class MusicLibraryController

  def initialize(path = './db/mp3s')
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

      songs = []
      Song.all.each {|song| songs << "#{song.artist.name} - #{song.name} - #{song.genre.name}"}
      songs.sort_by! {|song| song.split(" - ")[1]}
      songs.collect!.with_index {|song, position| "#{position + 1}. #{song}"}
      songs.each{|song| puts song}
      # binding.pry
    end

  end

end
