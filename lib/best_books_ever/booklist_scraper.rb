class BestBooksEver::Booklist_Scraper
  attr_accessor :name, :author, :position, :url, :description

  @@all = []

  def initialize(name=nil, author=nil, url=nil, position=nil)
    @name = name
    @author = author
    @url = url
    @position = position
    @@all << self
  end

  def self.bookscraper
    page = Nokogiri::HTML(open('https://www.goodreads.com/list/show/1.Best_Books_Ever'))

    page.css('tr').each do |bk|
      book = BestBooksEver::Booklist_Scraper.new()

      book.name = bk.css('a.bookTitle span').text.strip
      book.author = bk.css('a.authorName span').text.strip
      book.url = "https://www.goodreads.com#{bk.css('a.bookTitle @href').first.value}"
      book.position = bk.css('td.number').text.strip
    end
    self.all
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
    @description ||= doc.css('div#description').text.strip.split("\n")[1].strip
  end
end
