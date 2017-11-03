class BestBooksEver::Booklist
  attr_accessor :name, :author, :position, :url, :description

  @@all = []

  def self.new_from_top_page(b) #hash student scraper lab
    self.new(
      b.css("tbody.tr.td.a.bookTitle.span.name").text,
      "http://www.goodreads.com#{b.css("a").attribute("href").text}",
      b.css("a.authorName span.name").text,
      b.css("td.number").text
      )
      binding.pry
    end

  def initialize(book_hash)
    @name = book_hash[:name]
    @url = book_hash[:url]
    @author = book_hash[:author]
    @position = book_hash[:position]
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

  def author
    @author ||= doc.xpath("//div[@class='authorName']/span").text
  end

  def description
    @description ||=doc.xpath("//div")
  end


end
