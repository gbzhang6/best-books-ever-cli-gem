class BestBooksEver::CLI

  def call
    BestBooksEver::Scraper.new.make_booklist
    puts "Welcome to the Best Books Ever List from Goodreads"
    start
  end

  

end
