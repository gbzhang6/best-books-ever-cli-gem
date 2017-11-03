class BestBooksEver::Scraper

  def scrape_books_attributes
    doc = Nokogiri::HTML(open("https://www.goodreads.com/list/show/1.Best_Books_Ever"))
    book_attributes = []
    doc.css("table.tableList tr").each do |book|
    binding.pry
    # create hash
    # give hash key / values
    # push hash into book attributes
    end
    #return book attributes
  end

  def make_booklist
    scrape_books_attributes.each do |b|
      BestBooksEver::Booklist.new_from_top_page(b)
    end
  end
end
