#require 'pry'
class Board
  attr_accessor :cells
  def initialize
    @cells= []
    @cells = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def reset!
    @cells.clear#https://ruby-doc.org/core-2.4.1/Array.html, clear method
    @cells= [" ", " ", " ", " ", " ", " ", " ", " ", " "]
  end
  def display
    #binding.pry
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    puts "-----------"
    puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    puts "-----------"
    puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end
  def position(user_input)
    integer = user_input.to_i- 1#converst user input string to array index
    #binding.pry
    return "#{@cells[integer]}"#looks up the value of the cells at the correct index from the array's perspective
  end
  def full?#defines the full? method w/board array
      cells.all? { |elem| # iterate through ALL of the board array
        elem == "X"  || elem == "O" || elem != " "#value is comparable to X OR O OR is not empty
      }
  end
  def turn_count
    i = 0
      cells.each_with_index do |value, index|
          #https://launchschool.com/books/ruby/read/loops_iterators#controllloop
          if value == "X" || value == "O"
            i = i + 1
          end
        #end
      end
    i
  end
  def taken?(cells_index)
    if cells_index == "1" || cells_index == "9"
      true
    else
      false
    end
  end
  def valid_move?(value)
    if value == "1"
      true
    end
  end
  def update(player_position, token = "X")
    #binding.pry
    number = position(player_position).to_i
    #binding.pry
    self.cells[number] = token
  end
  #end
end
#https://rosettacode.org/wiki/Tic-tac-toe#Ruby
#https://codequizzes.wordpress.com/2013/10/25/creating-a-tic-tac-toe-game-with-ruby/
