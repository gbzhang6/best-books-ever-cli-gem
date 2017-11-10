class BestBooksEver::Book
  attr_accessor :name, :author, :position, :url, :description

  @@all = []

  def initialize(name=nil, author=nil, url=nil, position=nil)
    @name = name
    @author = author
    @url = url
    @position = position
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(num)
    self.all[num-1]
  end

  def self.find_by_author(name)
    #this method will return an array of all book objects that have the author passed in as name
    @@all.select { |author| author.author == name }
  end
  #BestBooksEver::Book.find_by_author("J.K. Rowling")
  #=> [<Book >, <Book >]

end
