class MusicImporter

  attr_accessor :path

def initialize(path)
  @path = path #path="./spec/fixtures/mp3s"
end

def files
  array = Dir.entries(path)
  array.delete("..")
  array.delete(".")
  array
  #binding.pry
  # better
  # Dir.chdir(@path) do |path|
  #   Dir.glob("*.mp3")
  # end
end

 def import
 self.files.each do |file|
   Song.create_from_filename(file)
  end
 end

end
