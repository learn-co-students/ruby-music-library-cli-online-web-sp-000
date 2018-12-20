require 'pry'

class MusicLibraryController
  attr_accessor :path
  
  def initialize(path = './db/mp3s')
    x = MusicImporter.new(path)
    x.import
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
      input = ''
      while input != 'exit'
        puts "What would you like to do?"
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
        when 'play song'
          play_song
        end
      end
  end
  
  def list_songs 
    x = Song.all.sort_by{|k, v| k.name}
    x.each_with_index do |x, i|
      puts "#{i+1}. #{x.artist.name} - #{x.name} - #{x.genre.name}"
    end
  end 
  
  def list_artists 
    x = Artist.all.sort_by{|k, v| k.name}
    x.each_with_index do |x, i|
      puts "#{i+1}. #{x.name}"
    end
  end
  
  def list_genres 
    x = Genre.all.sort_by{|k, v| k.name}
    x.each_with_index do |x, i|
      puts "#{i+1}. #{x.name}"
    end
  end
  
  def list_songs_by_artist 
    puts "Please enter the name of an artist:"
    input = gets.strip
    #binding.pry
    if Artist.all.any?{|x| x.name == input} == true 
      x = Artist.all.select{|x| x.name == input}
      y = x[0].songs.sort_by{|k, v| k.name}
      y.each_with_index do |x, i| 
        puts "#{i+1}. #{x.name} - #{x.genre.name}"
      end
    end
  end 
  
  def list_songs_by_genre 
    puts "Please enter the name of a genre:"
    input = gets.strip
    if Genre.all.any?{|x| x.name == input} == true 
      x = Genre.all.select{|x| x.name == input}
      y = x[0].songs.sort_by{|k, v| k.name}
      y.each_with_index do |x, i| 
        puts "#{i+1}. #{x.artist.name} - #{x.name}"
      end
    end 
  end
  
  def play_song 
    puts "Which song number would you like to play?"
    input = gets.strip
    user_input = input.to_i - 1
    song_list = Song.all.sort_by{|k, v| k.name}
    if user_input > 0 && input.to_i <= song_list.size 
      puts "Playing #{song_list[user_input].name} by #{song_list[user_input].artist.name}"
    else 
      nil
    end
  end
  
end  