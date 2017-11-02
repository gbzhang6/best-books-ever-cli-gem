class BestBooksEver::Booklist
  attr_accessor :name, :author, :position, :url, :description

  @@all = []

  def self.new_from_top_page(b)
    self.new(
      b.css("tbody/tr/td/a.bookTitle/span.name").text,
      "http://www.goodreads.com#{b.css("a").attribute("href").text}",
      b.css("a.authorName span.name").text,
      b.css("td.number").text
      )
    end

  def initialize(name=nil, url=nil, author=nil, position=nil)
    @name = name
    @url = url
    @author = author
    @position = position
    @@all << self
  end

  def self.all
    @@all
  end

  def self.find(num)
    self.all[num-1]
  end

  def bookpage
    @bookpage ||= Nokogiri::HTML(open(self.url))
  end

  def author
    @author ||= bookpage
  end


end
