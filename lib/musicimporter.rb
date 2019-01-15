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
    current_dir = Dir.getwd
    Dir.chdir(@path)
    filenames = Dir.glob("*.mp3")
    Dir.chdir(current_dir)
    filenames
  end

end
