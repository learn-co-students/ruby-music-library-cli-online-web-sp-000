class MusicImporter

  attr_reader :path

  def initialize(path)
    @path = path
  end

  def files
    # puts @path
    # binding.pry
    collection = []
    Dir.open(@path).select do |file|
      collection << file if file.end_with?(".mp3")
    end
  end

  # def self.import
  # end
end
