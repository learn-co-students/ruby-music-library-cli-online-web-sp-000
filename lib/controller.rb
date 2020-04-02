class MusicLibraryController
  def initialize(path="./db/mp3s")
    MusicImporter.new(path).import
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

      request = gets.strip
      if request == 'exit'
      elsif request == 'list_songs'
        list_songs
        call
      else
        call
      end
  end

  def list_songs
    alphabetizedTitle =[]
    Song.all.each_with_index do |s, i|
      alphabetized << "#{i+1}. #{s.artist.name} - #{s.name} - #{s.genre.name}"
    end
    binding.pry

    alphabetized.sort
  end
end
