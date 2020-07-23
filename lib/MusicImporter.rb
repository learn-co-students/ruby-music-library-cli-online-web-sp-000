class MusicImporter

attr_accessor :path

def initialize(path)
@path = path
end

def files
  Dir.chdir(@path) do
    @files = Dir.glob("*.mp3")
  end
  @files
end

def import
     files.each{ |filenames| Song.create_from_filename(filenames) }
   end












end
