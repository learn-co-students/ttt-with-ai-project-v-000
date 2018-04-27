require 'pry'
class Board
  attr_accessor :cells


  def reset!
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def initialize
    @cells = [" "," "," "," "," "," "," "," "," "]
  end

  def display
    puts " #{@cells[0]} | #{@cells[1]} | #{@cells[2]} "
    puts "-----------"
    puts " #{@cells[3]} | #{@cells[4]} | #{@cells[5]} "
    puts "-----------"
    puts " #{@cells[6]} | #{@cells[7]} | #{@cells[8]} "
  end

  def position(input)
    cells[input.to_i - 1]
    end

    def full?
    if  cells.count("X") + cells.count("O") == 9
           true
        else
          false
        end
      end

    def turn_count
      return cells.count("X") + cells.count("O")
    end

    def taken?(input)
      position(input) == "X" || position(input) == "O"
    end

    def valid_move?(input)
    #  taken?(input) == false && input.to_i < 10
      input.to_i.between?(1,9) && !taken?(input)
      end

      def update(input, player)
        cells[input.to_i - 1] = player.token
      end
end
