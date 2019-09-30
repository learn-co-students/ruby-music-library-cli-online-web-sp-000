class MusicLibraryController

  extend Concerns::Findable

  
  def initialize(user_input = './db/mp3s')
    @user_input = user_input
    music_importer = MusicImporter.new(user_input)
    music_importer.import
  end  

  def call
    puts "Welcome to your music library!"
    exit_value = ""  
    
    while exit_value != "exit"
      
      if exit_value != "exit"
        puts "To list all of your songs, enter 'list songs'."
        @user_input = gets.chomp
        
        if @user_input == 'list songs'
          list_songs
        end
        
      end
      
      puts "If you would like to exit, please type in exit"
      exit_value = gets.chomp
    
    end
  
  end
  
  def list_songs
    puts Song.all.sort
  end
  
  def play_song
    
  end

  
end