class BestBooksEver::Booklist
  attr_accessor :name, :author, :position, :url, :description

  @@all = []

  def self.new_from_top_page(b) #hash student scraper lab
    self.new(
      b.css("a.bookTitle span").text,
      b.css("a.authorName span").text,
      b.css("a.bookTitle @href").first.value,
      b.css("td.number").text
      )
    end

  def initialize (name=nil, url=nil, author=nil, position=nil)
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

  def doc
    @doc ||= Nokogiri::HTML(open(self.url))
  end

  def description
    @description ||=doc.css()
    binding.pry
  end


end
