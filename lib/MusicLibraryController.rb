class MusicLibraryController
  attr_accessor :path, :musicImporter

  def initialize(path="./db/mp3s")
    @path = path
    @musicImporter = MusicImporter.new(@path)
    @musicImporter.import
  end
  def intro_message
    puts "To list all of your songs, enter 'list songs'."
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end
  def list_songs
# "1. Thundercat - For Love I Come - dance"
    idx = 1
    Song.all.sort_by{ |obj| obj.name }.each do |item|
      puts "#{idx}. #{item.artist.name} - #{item.name} - #{item.genre.name}"
      idx = idx + 1
    end
  end
  def list_artists
# "1. Action Bronson")
    idx = 1
    Artist.all.sort_by{ |obj| obj.name }.each do |item|
      puts "#{idx}. #{item.name}"
      idx = idx + 1
    end
  end
  def list_genres
    idx = 1
    Genre.all.sort_by{ |obj| obj.name }.each do |item|
      puts "#{idx}. #{item.name}"
      idx = idx + 1
    end
  end
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets.chomp
    artist = Artist.find_by_name(name)
    if artist != nil
      idx = 1
      artist.songs.sort_by{ |obj| obj.name }.each do |item|
# expect($stdout).to receive(:puts).with("1. Green Aisles - country")
        puts "#{idx}. #{item.name} - #{item.genre.name}"
        idx = idx + 1
      end
    end
  end
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name = gets.chomp
    genre = Genre.find_by_name(name)
    if genre != nil
      idx = 1
      genre.songs.sort_by{ |obj| obj.name }.each do |item|
        puts "#{idx}. #{item.artist.name} - #{item.name}"
        idx = idx + 1
      end
    end
  end
  def play_song
    puts "Which song number would you like to play?"
    num = gets.chomp.to_i
# expect($stdout).to receive(:puts).with("Playing Larry Csonka by Action Bronson")
    if num > 0 && num < Song.all.size
      puts "Playing #{Song.all.sort_by{ |obj| obj.name }[num - 1].name} by #{Song.all.sort_by{ |obj| obj.name }[num - 1].artist.name}"
    end
  end

  def handle_message(input)
    if input == 'list songs'
      list_songs
    elsif input == 'list artists'
      list_artists
    elsif input == 'list genres'
      list_genres
    elsif input == 'list artist'
      list_songs_by_artist
    elsif input == 'list genre'
      list_songs_by_genre
    elsif input == 'play song'
      play_song
    else
      "exit"
    end
  end

  def call
    puts("Welcome to your music library!")
    userInput = ""
    while userInput != "exit"
      intro_message
      userInput = gets.chomp
      handle_message(userInput)
    end

  end
end
