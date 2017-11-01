class BestBooksEver::Booklist
  attr_accessor :name, :author, :position, :url, :description

  @@all = []

  def self.new_from_index_page(b)
  self.new(
    b.css("a.bookTitle span.name").text,
    "www.goodreads.com#{r.css("a").attribute("href").text}",
    b.css("a.authorName span.name").text,
    b.css("td.number").text
    )
  end

end
