class MusicLibraryController

  attr_accessor :path, :new_music_importer

  def initialize(path="./db/mp3s")
    @path = path
    @new_music_importer = MusicImporter.new(path)
    @imported_files = @new_music_importer.import
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

    response = gets.strip

    while response != "exit" do
      puts "What would you like to do?"
      response = gets.strip
    end
  end

  def list_songs

    sorted = @imported_files.sort_by{|file| file.gsub(@path + "/","").split("-")[1].strip}

    sorted.each_with_index do |obj, index|
      puts "#{index + 1}. " + "#{obj.gsub(@path + "/","").gsub(".mp3","")}"
    end

  end

  def list_artists

    artist_list = []

    Artist.all.each do |artist|
      artist_list << artist.name
    end

    artist_list_sorted = artist_list.sort

    artist_list_sorted.each_with_index do |obj, index|
      puts "#{index + 1}. " + "#{obj}"
    end

  end

  def list_genres

    genres_list = []

    Genre.all.each do |genre|
      genres_list << genre.name
    end

    binding.pry

    genres_list_sorted = genres_list.sort

    genres_list_sorted.each_with_index do |obj, index|
      puts "#{index + 1}. " + "#{obj}"
    end

  end


end
