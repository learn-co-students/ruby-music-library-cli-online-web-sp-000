class MusicImporter

attr_accessor :path

def initialize(path)
  @path=path
end

def files
  @files=Dir.entries(path).each_with_object([]) do |song, arr|
    arr<< song if song.include?("mp3")
  end
end

def import
  files.each {|filename| Song.create_from_filename(filename)}
end

end
