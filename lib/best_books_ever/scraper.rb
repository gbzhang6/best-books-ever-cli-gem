class BestBooksEver::Scraper
  attr_accessor :name, :author, :position, :url, :description

  def self.bookscraper
    page = Nokogiri::HTML(open("https://www.goodreads.com/list/show/1.Best_Books_Ever"))

    page.css ("table.tableList tr").each do |bk|
      book = BestBooksEver::Scraper.new()

      book.name = bk.css("a.bookTitle span").text.strip,
      book.author = bk.css("a.authorName span").text.strip,
      book.url = bk.css("a.bookTitle @href").first.value,
      book.position = bk.css("td.number").text.strip
    end
    self.all
  end

end
