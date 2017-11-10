class BestBooksEver::CLI

  def call
    BestBooksEver::Booklist_Scraper.bookscraper
    binding.pry
    puts "Welcome to the Best Books Ever List from Goodreads!"
    start
  end

  def not_valid(user_input)
    if !user_input.between?(1, 100)
      puts "This is not a valid response, please enter a number from 1-100 or type exit."
      input = gets.strip.to_i
      not_valid(input)
    elsif user_input <= 100
      return user_input
    else
      exit
    end
  end

  def start
    puts
    puts "What number books would you like to see? 1-20, 21-40, 41-60, 61-80, 81-100?"
    input = not_valid(gets.strip.to_i)

    print_booklists(input)

    puts
    puts "Which book would you like more information on?"
    input = not_valid(gets.strip.to_i)

    book = BestBooksEver::Book.find(input.to_i)
    BestBooksEver::Booklist_Scraper.scrape_description(book)

    print_booklist(book)

    puts "Would you like to see another book? Enter Y or N"

    input = gets.strip.downcase
    if input == "y"
      start
    else
      puts "See you again soon for another great book!"
      exit
    end
  end

  def print_booklists(from_num)
    puts
    puts "----------Books #{from_num} - #{from_num+19}----------"
    puts
    BestBooksEver::Book.all[from_num-1, 20].each.with_index(from_num) do |book, i|
      puts "#{i}. #{book.name} - #{book.author}"
    end
  end

  def print_booklist(book)
    puts
    puts "---------No.#{book.position}--#{book.name}--------"
    puts "Author:        #{book.author}"
    puts
    puts "-------------------Description-------------------"
    puts "#{book.description}"
    puts
  end

end
