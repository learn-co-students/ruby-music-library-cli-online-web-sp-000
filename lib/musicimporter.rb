require 'pry'
class MusicImporter
  attr_accessor :path
  def initialize(file_path)
    @path = file_path
  end

  def path
     Dir["./spec/fixtures/mp3s"].select {|f| File.file? f}
     @path
  end

  def files
    current_dir = Dir.getwd #returns path of current working directory as a string
    Dir.chdir(@path)  #change directory
    filenames = Dir.glob("*.mp3") #returns filenames found by patterns
    Dir.chdir(current_dir)
    filenames
  end

  def import

  end

end
