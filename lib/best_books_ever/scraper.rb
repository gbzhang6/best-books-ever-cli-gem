class BestBooksEver::Scraper
  def get_page
    Nokogiri::HTML(open("https://www.goodreads.com/list/show/1.Best_Books_Ever"))
  end

  def scrape_books_attributes
    book_attributes = []
    self.get_page.css("table.tableList tr").each do |book|
      # create hash
      book_hash = Hash.new
      # give hash key / values
      book_hash[:name] = book.css("a.bookTitle span").text
      book_hash[:author] = book.css("a.authorName span").text
      book_hash[:url] = book.css("a.bookTitle @href").first.value
      book_hash[:position] = book.css("td.number").text
      # push hash into book attributes
      book_attributes << book_hash
    end
    #return book attributes
    book_attributes
  end

end
