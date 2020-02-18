class MusicLibraryController
  def initialize(path='./db/mp3s')
    importer = MusicImporter.new(path)
    importer.import
  end
  def call
    puts "Welcome to your music library! What would you like to do?"
    input = gets.strip
    case input
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
    when 'play_song'
      play_song
    when 'exit'
      exit
    else
      puts "I'm sorry, that's not a recognized command."
    end
  end
  def list_songs
    songs = Song.all.sort {|a, b| a <=> b}
    counter = 1
    songs.each do |song|
      puts "#{counter}. #{song}."
      counter += 1
    end
  end
  def list_artists
     artists = Song.all.sort {|a, b|}
     counter = 1
     artist.each do |artist|
       puts "#{counter}: #{artist}"
     end
  end
  def list_genres
  end
  def list_songs_by_artist
    #needs to accept user input
    puts "Please enter an artist:"
    reply = gets.strip
  end
  def list_songs_by_genre
    puts "Please enter a genre:"
    reply = gets.strip
  end
  def play_song
    puts "Please select a song from the list:"
    list_songs
    reply = gets.strip
    #check if valid number
  end
end
