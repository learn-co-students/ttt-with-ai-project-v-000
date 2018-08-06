require 'pry'
class Board

  WIN_COMBINATIONS = [
   [0, 1, 2],
   [3, 4, 5],
   [6, 7, 8],
   [0, 3, 6],
   [1, 4, 7],
   [2, 5, 8],
   [0, 4, 8],
   [2, 4, 6]
  ]

  attr_accessor :cells

  def initialize(cells = Array.new(9, " "))
    @cells = cells
  end

  def reset!
     @cells = Array.new(9, " ")
  end

  def display
    print " #{cells[0]} | #{cells[1]} | #{cells[2]} "
    print "-----------"
    print " #{cells[3]} | #{cells[4]} | #{cells[5]} "
    print "-----------"
    print " #{cells[6]} | #{cells[7]} | #{cells[8]} "
  end

      def input_to_index(input)
      input.to_i - 1
  end

  def move(index, token)
    @cells[index] = token
  end

  def position_taken?(cells, index)
  !(cells[index].nil? || cells[index] == " ")
  end

  def valid_move?(index, cells)
    index.between?(0, 8) && !position_taken?(cells, index)
  end

  def turn_count
  @cells.count {|position| position != " "}
  end

  def current_player
  turn_count % 2 == 0 ? "X" : "O"
  end

  def won?
   WIN_COMBINATIONS.detect do |win_index|

   position_1 = @board [win_index[0]]
   position_2 = @board [win_index[1]]
   position_3 = @board [win_index[2]]


   position_1 == "X" && position_2 == "X" && position_3 == "X" ||
   position_1 == "O" && position_2 == "O" && position_3 == "O"

   end
  end

  def full?
    @cells.all? do|space|
    space == "X" || space == "O"
  end
  end

  def draw?
   !won? && full?
  end

  def over?
    draw? || won?
  end

  def winner
      won? && @cells[won?[0]]
  end

  def play
    until over?
      position
    end
      if won?
        puts "Congratulations #{winner}!"
      end
      if draw?
        puts "Cat's Game!"
      end
  end

  def position(cells)
    puts "Please enter a number 1 - 9"
      input = STDIN.gets.strip
      index = input_to_index(input)
      if valid_move?(index, cells)
        move(index, current_player)
        display
        #puts "#{cells[index]}"
      else
        puts "try again."
      end
  end


end
