require 'pry'
class MusicImporter

  def initialize(file_path)
    @path = file_path
  end

  def path
    # Dir["./spec/fixtures/mp3s"].select {|f| File.file? f}
     Dir["./spec/fixtures/mp3s"]
  end

  def files

  end

end
