class BestBooksEver::Scraper

  def scrape_books_attributes
    doc = Nokogiri::HTML(open("https://www.goodreads.com/list/show/1.Best_Books_Ever"))
    book_attributes = []
    doc.css("table.tableList tr").each do |book|
      binding.pry
      # create hash
      book_hash = Hash.new
      # give hash key / values
      book_hash[:name] = book.css("a.bookTitle span").text
      book_hash[:author] = book.css("a.authorName span").text
      book_hash[:url] = book.css("a.bookTitle").attr ("href").value
      book_hash[:position] = ("td.number").text
      # push hash into book attributes
      book_attributes << book_hash
    end
    #return book attributes
    book_attributes
  end

  def make_booklist
    scrape_books_attributes.each do |b|
      BestBooksEver::Booklist.new_from_top_page(b)
    end
  end
end
