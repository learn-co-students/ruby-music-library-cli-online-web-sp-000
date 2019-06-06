require "pry"

class MusicLibraryController
  
  def initialize(path = "./db/mp3s")
    importer = MusicImporter.new(path)
    importer.import
  end
  
  def call
    puts "Welcome to your music library!"
    puts "To list all of your songs, enter 'list songs'."
    input = gets

    while input != "exit"
      input = gets
    end
  
    puts "To list all of the artists in your library, enter 'list artists'."
    puts "To list all of the genres in your library, enter 'list genres'."
    puts "To list all of the songs by a particular artist, enter 'list artist'."
    puts "To list all of the songs of a particular genre, enter 'list genre'."
    puts "To play a song, enter 'play song'."
    puts "To quit, type 'exit'."
    puts "What would you like to do?"
  end
  
  def list_songs
    
    
  end
end

=begin

 describe "#call" do
    let(:music_library_controller) { MusicLibraryController.new("./spec/fixtures/mp3s") }

    it "welcomes the user" do
      allow(music_library_controller).to receive(:gets).and_return("exit")

      expect($stdout).to receive(:puts).with("Welcome to your music library!")
      expect($stdout).to receive(:puts).with("To list all of your songs, enter 'list songs'.")
      expect($stdout).to receive(:puts).with("To list all of the artists in your library, enter 'list artists'.")
      expect($stdout).to receive(:puts).with("To list all of the genres in your library, enter 'list genres'.")
      expect($stdout).to receive(:puts).with("To list all of the songs by a particular artist, enter 'list artist'.")
      expect($stdout).to receive(:puts).with("To list all of the songs of a particular genre, enter 'list genre'.")
      expect($stdout).to receive(:puts).with("To play a song, enter 'play song'.")
      expect($stdout).to receive(:puts).with("To quit, type 'exit'.")
      expect($stdout).to receive(:puts).with("What would you like to do?")

      music_library_controller.call
    end

    it "asks the user for input" do
      allow(music_library_controller).to receive(:gets).and_return("exit")

      expect(music_library_controller).to receive(:gets)

      capture_puts { music_library_controller.call }
    end

    it "loops and asks for user input until they type in exit" do
      allow(music_library_controller).to receive(:gets).and_return("a", "b", "c", "exit")

      expect(music_library_controller).to receive(:gets).exactly(4).times

      capture_puts { music_library_controller.call }
    end
  end
end
=end
