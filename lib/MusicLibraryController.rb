require 'pry'

class MusicLibraryController
  def initialize(path="./db/mp3s")
    musicImporter = MusicImporter.new(path)
    musicImporter.import
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

    choice = gets.chomp
    while choice != "exit" do
      if choice == "list songs"
        list_songs
      elsif choice == "list artists"
        list_artists
      elsif choice == "list genres"
        list_genres
      elsif choice == "list artist"
        list_songs_by_artist
      elsif choice == "list genre"
        list_songs_by_artist
      elsif choice == "play song"
        play_song
      end
      choice = gets.chomp
    end
  end

  def list_songs
    sorted_songs = Song.all.sort_by {|song| song.name}
    item_count = 1
    sorted_songs.each do |song|
      puts (item_count.to_s + ". "+song.artist.name + " - "+song.name+ " - "+song.genre.name)
      item_count +=1
    end
    sorted_songs
  end

  def list_artists
    print_items(Artist.all)
  end

  def list_genres
    print_items(Genre.all)
  end

  def print_items(arr)
    sorted_items = arr.sort_by {|item| item.name}
    item_count = 1
    sorted_items.each do |item|
      puts item_count.to_s + ". "+item.name
      item_count +=1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"

    name_of_artist = gets.chomp
    count_item = 1
    artist_songs = Song.all.select do |song| song.artist.name == name_of_artist
    end
    #puts "name of artist "+name_of_artist
    #puts "artist song size" + artist_songs.size.to_s
    sorted_songs = artist_songs.sort_by { |song| song.name }
    sorted_songs.each do |song|
      puts count_item.to_s + ". " + song.name + " - " + song.genre.name
      count_item += 1
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"

    name_of_genre = gets.chomp
    count_item = 1
    genre_songs = Song.all.select do |song| song.genre.name == name_of_genre
    end
    #puts "name of artist "+name_of_artist
    #puts "artist song size" + artist_songs.size.to_s
    sorted_songs = genre_songs.sort_by { |song| song.name }
    sorted_songs.each do |song|
      puts count_item.to_s + ". " + song.artist.name + " - " + song.name
      count_item += 1
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    sorted_songs = list_songs
    number_of_song = gets.chomp
    if number_of_song.numberic?
      song = sorted_songs[number_of_song.to_i]
    end

  end
end
