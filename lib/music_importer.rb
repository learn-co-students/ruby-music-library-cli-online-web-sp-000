class MusicImporter

  attr_accessor :path

  def initialize(path)
    @path = path
  end

  def files
    Dir.chdir(@path) do | path | #Changes directory
      Dir.glob("*.mp3")          #Globs items from directory that are .mp3
    end
  end

  def import
    files.each {|file| Song.create_from_filename(file)}
  end
end
