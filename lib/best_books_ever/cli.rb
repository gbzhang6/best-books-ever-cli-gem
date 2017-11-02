class BestBooksEver::CLI

  def call
    BestBooksEver::Scraper.new.make_booklist
    puts "Welcome to the Best Books Ever List from Goodreads!"
    start
  end

  def start
    puts " "
    puts "What number books would you like to see? 1-20, 21-40, 41-60, 61-80, 81-100?"
    input = gets.strip.to_i

    print_booklists(input)

    puts ""
    puts "Which book would you like more information on?"
    input = gets.strip

    book = BestBooksEver::Booklist.find(input.to_i)
    print_booklist(book)

    input = gets.strip.downcase
  end

  def print_booklists(from_num)
    puts ""
    puts "----------Books #{from_num} - #{from_num+19}----------"
    puts ""
    BestBooksEver::Booklist.all[from_num-1, 20].each.with_index(i) do |book, i|
      puts "#{i}. #{book.name} - #{book.author}"
    end
  end

  def print_booklist(book)
    puts ""
    puts "-------------#{book.name}-#{book.position}-------------"
    puts ""
    puts "Author:        #{book.author}"
    puts ""
    puts "-------------------Description-------------------"
    puts "#{book.description}"
    puts ""
  end



end
