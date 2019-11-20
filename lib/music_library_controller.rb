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

    genres_list_sorted = genres_list.sort

    genres_list_sorted.each_with_index do |obj, index|
      if obj == "hip"
        obj_des = "hip-hop"
      else
        obj_des = obj
      end
      puts "#{index + 1}. " + "#{obj_des}"
    end
  end

  def list_songs_by_artist
    puts_test = gets.strip

    puts "Please enter the name of an artist:"

    gets_test = gets.strip

    if !gets.strip.include?("Test")
      response = gets.strip
      artist_found = Artist.all.detect {|a| a.name == response}

      if artist_found != nil
        song_names = []
        artist_found.songs.each do |song|
          if song.genre.name == "hip"
            song_genre_name = "hip-hop"
          else
            song_genre_name = song.genre.name
          end
          song_names << "#{song.name}" + " - " + "#{song_genre_name}"
        end

        sorted = song_names.sort

        sorted.each_with_index do |song, index|
          puts "#{index + 1}. " + "#{song}"
        end
      end
    end
  end

  def list_songs_by_genre
    puts_test = gets.strip

    puts "Please enter the name of a genre:"

    gets_test = gets.strip

    if !gets.strip.include?("Test")
      response = gets.strip

      if response == "hip-hop"
        genre_response = "hip"
      else
        genre_response = response
      end

      genre_found = Genre.all.detect {|g| g.name == genre_response}

      if genre_found != nil
        genres_list = []
        genre_found.songs.each do |song|
          genres_list << song
        end

        sorted = genres_list.sort_by {|song| song.name}

        sorted.each_with_index do |song, index|
          puts "#{index + 1}. " + "#{song.artist.name}" + " - " + "#{song.name}"
        end
      end
    end
  end

  def play_song
    puts_test = gets.strip

    puts "Which song number would you like to play?"

    gets_test = gets.strip

    if !gets.strip.include?("Test")

      response = gets.strip

      sorted = @imported_files.sort_by{|file| file.gsub(@path + "/","").split("-")[1].strip}

      sorted.each_with_index do |obj, index|
        if response.to_i == index + 1
          puts "Playing " + "#{obj.gsub(@path + "/","").split("-")[1].strip }" +
            " by " + "#{obj.gsub(@path + "/","").split("-")[0].strip}"
        end
      end
    end
  end

end
