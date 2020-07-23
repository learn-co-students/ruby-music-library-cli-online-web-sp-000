class MusicLibraryController

  def initialize(path = "./db/mp3s")
    MusicImporter.new(path).import
  end

  def call
    input = ''
  while input != 'exit'
    input = gets.chomp
    case input
    when exit
      puts "Bye"
    end
  end
end
end
