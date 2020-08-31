class MusicLibraryController

  def initialize(path = './db/mp3s')
    thisImporter = MusicImporter.new(path)
    @importedSongs = thisImporter.import
  end

  def list_songs
    rArray = []
    alphabetizedArray = []
    Song.all.each do | selectedSong |
      alphabetizedArray << selectedSong.name
    end
    alphabetizedArray = alphabetizedArray.sort.uniq
    alphabetizedArray.each do | selectedSongName |
      rArray << Song.find_by_name(selectedSongName)
    end
    i = 1
    rArray.each do | selected |
      puts ("#{i}. #{selected.artist.name} - #{selected.name} - #{selected.genre.name}")
      i += 1
    end
  end

  def list_artists
    rArray = []
    alphabetizedArray = []
    Artist.all.each do | selected |
      alphabetizedArray << selected.name
    end
    alphabetizedArray = alphabetizedArray.sort.uniq
    alphabetizedArray.each do | selectedName |
      rArray << Artist.find_by_name(selectedName)
    end
    i = 1
    rArray.each do | selected |
      puts ("#{i}. #{selected.name}")
      i += 1
    end
  end

  def list_genres
    rArray = []
    alphabetizedArray = []
    Genre.all.each do | selected |
      alphabetizedArray << selected.name
    end
    alphabetizedArray = alphabetizedArray.sort.uniq
    alphabetizedArray.each do | selectedName |
      rArray << Genre.find_by_name(selectedName)
    end
    i = 1
    rArray.each do | selected |
      puts ("#{i}. #{selected.name}")
      i += 1
    end
  end

  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    ui2 = gets.strip
    actualArtist = Artist.find_by_name(ui2)
    #binding.pry
    alphabetizedArray = []
    if (actualArtist == nil)
      passing = false
      return
    end
    actualArtist.songs.each do | selectedSong |
      alphabetizedArray << selectedSong.name
    end
    alphabetizedArray = alphabetizedArray.sort.uniq
    i = 1
    #binding.pry
    alphabetizedArray.each do | selected |
      puts ("#{i}. #{selected} - #{Song.find_by_name(selected).genre.name}")
      i += 1
    end
  end

  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    ui2 = gets.strip
    actualGenre = Genre.find_by_name(ui2)
    #binding.pry
    alphabetizedArray = []
    if (actualGenre == nil)
      passing = false
      return
    end
    actualGenre.songs.each do | selectedSong |
      alphabetizedArray << selectedSong.name
    end
    alphabetizedArray = alphabetizedArray.sort.uniq
    i = 1
    #binding.pry
    alphabetizedArray.each do | selected |
      puts ("#{i}. #{Song.find_by_name(selected).artist.name} - #{selected}")
      i += 1
    end
  end

  def play_song
    puts "Which song number would you like to play?"
    ui3 = gets.strip
    ui3 = ui3.to_i
    if (ui3 > Song.all.length || ui3 < 1)
      return nil
    else
      returnArray = []
      alphabetizedArray = []
      Song.all.each do | selectedSong |
        alphabetizedArray << selectedSong.name
      end
      alphabetizedArray = alphabetizedArray.sort.uniq
      alphabetizedArray.each do | selectedSongName |
        returnArray << Song.find_by_name(selectedSongName)
      end
      if (returnArray[ui3 - 1] == nil)
        return
      end
      puts "Playing #{returnArray[ui3 - 1].name} by #{returnArray[ui3 - 1].artist.name}"
    end
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
    ui1 = ""
    while (ui1 != "exit")
      ui1 = gets.strip
      if (ui1 == "list songs")
        self.list_songs
      elsif (ui1 == "list artists")
        self.list_artists
      elsif (ui1 == "list genres")
        self.list_genres
      elsif (ui1 == "list artist")
        self.list_songs_by_artist
      elsif (ui1 == "list genre")
        self.list_songs_by_genre
      elsif (ui1 == 'play song')
        self.play_song
      end
    end
  end

end
