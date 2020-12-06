class MusicLibraryController
  
  def initialize(path = './db/mp3s')
    importer = MusicImporter.new(path)
    importer.import 
    
  end
  
  def call 
    puts ("Welcome to your music library!")
    puts ("To list all of your songs, enter 'list songs'.")
    puts ("To list all of the artists in your library, enter 'list artists'.")
    puts ("To list all of the genres in your library, enter 'list genres'.")
    puts ("To list all of the songs by a particular artist, enter 'list artist'.")
    puts ("To list all of the songs of a particular genre, enter 'list genre'.")
    puts ("To play a song, enter 'play song'.")
    puts ("To quit, type 'exit'.")
    puts ("What would you like to do?")
    loop do 
      input = gets 
      case input
      when 'list songs'
        list_songs 
      when 'list artists'
        list_artists 
      when 'list genres'
        list_genres
      when 'play song'
        play_song
      when 'list artist'
        list_songs_by_artist
      when 'list genre'
        list_songs_by_genre
      when 'exit'
        break
      end
    end
  end
  
  def list_songs
    return Song.all.sort_by{|song| song.name}.each.with_index{|song, i| puts "#{i+1}. #{song.to_string}"}
  end 
  
  def list_artists
    return Artist.all.sort_by{|artist| artist.name}.each.with_index{|artist, i| puts "#{i+1}. #{artist.name}"}
  end
  
  def list_genres
    return Genre.all.sort_by{|genre| genre.name}.each.with_index{|genre, i| puts "#{i+1}. #{genre.name}"}
  end
  
  def list_songs_by_artist
    puts "Please enter the name of an artist:"
    name = gets
    current_artist = Artist.find_by_name(name)
    if(current_artist != nil)
        return current_artist.songs.sort_by{|song| song.name}.each.with_index{|song, i| puts "#{i+1}. #{song.name} - #{song.genre.name}"}
    end 
  end
  
  def list_songs_by_genre
    puts "Please enter the name of a genre:"
    name = gets
    current_genre = Genre.find_by_name(name)
    if(current_genre != nil)
        return current_genre.songs.sort_by{|song| song.name}.each.with_index{|song, i| puts "#{i+1}. #{song.artist.name} - #{song.name}"}
    end 
  end
  
  def play_song
    puts "Which song number would you like to play?"
    number = gets.to_i
    if(number > 0 && number <= Song.all.length)
      song_chosen = Song.all.sort_by{|song| song.name}[number-1]
      puts "Playing #{song_chosen.name} by #{song_chosen.artist.name}"
    end
  end
    
  

end