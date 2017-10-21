require 'colorize'

class Board
  attr_accessor :cells

  def initialize
    @cells = Array.new(9, " ")

  end

  def display(board)
        output = "\n"
        0.upto(8) do |position|
          output << color(board, position)
          case position % 3
          when 0, 1 then output << "|".colorize(:color => :white, :background => :black)
          when 2 then output << "\n" + "-----------".colorize(:color => :white, :background => :black) + "\n" unless position == 8
          end
        end
        puts output
      end

  def reset!
    self.cells = Array.new(9," ")
  end

  def position(input)
    self.cells[input.to_i - 1]
  end

  def full?
    !self.cells.include?(" ")
  end

  def turn_count
    self.cells.select {|cell| cell != " "}.count
  end

  def taken?(position)
    self.position(position) != " "
  end

  def valid_move?(input)
    !self.taken?(input) && (1..9).include?(input.to_i)
  end

  def update(input, player)
    self.cells[input.to_i - 1] = player.token if self.valid_move?(input)
  end

  private

  def color(board, position)
    if board.cells[position]
      " #{board.cells[position]} ".colorize(:color => :green, :background => :black)
    else
      " #{position} ".white
    end
  end


end
