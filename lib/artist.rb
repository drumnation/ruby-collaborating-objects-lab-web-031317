class Artist
  attr_accessor :name, :songs
  # read and write to :name and :songs

  @@all = []  # the great object bucket

  # general class methods

  def initialize(name) 
    @name = name
    @songs = []
    # initilize artist object with name and an array of songs
  end

  def self.all
    @@all
    # this returns all the artist objects
  end

  def save
    @@all << self
    # save the Artist object to the grand @@all bucket array
  end

  def add_song(song)
    self.songs << song
    # add song to artist's @songs
  end

  def print_songs
    self.songs.each { |song| puts song.name }
    # print all of an artist's song name
  end

  # constructor class methods

  def self.create_by_name(name)
    artist = self.new(name)
    artist.save
    artist
  end

  # finder class methods

  def self.find_by_name(name)
    @@all.find { |artist| artist.name == name }
  end

  def self.find_or_create_by_name(name)
    find_by_name(name) ? find_by_name(name) : create_by_name(name)
  end
  
end
