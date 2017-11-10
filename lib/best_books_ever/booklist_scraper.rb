class BestBooksEver::Booklist_Scraper
  attr_accessor :description


  def self.bookscraper
    page = Nokogiri::HTML(open('https://www.goodreads.com/list/show/1.Best_Books_Ever'))

    page.css('tr').each do |bk|
      book = BestBooksEver::Book.new

      book.name = bk.css('a.bookTitle span').text.strip
      book.author = bk.css('a.authorName span').text.strip
      book.url = "https://www.goodreads.com#{bk.css('a.bookTitle @href').first.value}"
      book.position = bk.css('td.number').text.strip
    end
  end

  def self.scrape_description(book)
    doc = Nokogiri::HTML(open(book.url))
    book.description ||= doc.css('div#description').text.strip.split("\n")[1].strip
  end
end
