class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(filename)
    filename.slice!(".mp3")
    data = filename.split(" - ")
    song = self.new
    song.artist_name = data[0]
    song.name = data[1]
    song
  end

  def self.create_from_filename(filename)
    filename.slice!(".mp3")
    data = filename.split(" - ")
    song = self.new
    song.artist_name = data[0]
    song.name = data[1]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
