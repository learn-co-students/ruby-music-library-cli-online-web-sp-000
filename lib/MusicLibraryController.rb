class MusicLibraryController

  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path).import
  end

  def call
  loop do
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
    gets.strip
      if gets.strip == "exit"
        break
      end
    end
  end

  def list_songs
    counter = 1
    # binding.pry
    Song.all.sort { |a,b| a.name <=> b.name }.each do |s|
      # binding.pry
      puts "#{counter}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
      counter += 1
    end
    # .sort { |a,b| a.name <=> b.name }
  end

end
