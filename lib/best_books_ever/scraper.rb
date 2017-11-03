class BestBooksEver::Scraper

  def get_page
    Nokogiri::HTML(open("https://www.goodreads.com/list/show/1.Best_Books_Ever"))
  end

  def scrape_books_attributes
    self.get_page.css("table.tableList tr")
  end

  def make_booklist
    scrape_books_attributes.each do |r|
      BestBooksEver::Booklist.new_from_top_page(b)
    end
  end
end
