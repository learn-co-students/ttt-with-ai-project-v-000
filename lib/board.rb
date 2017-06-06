class Board
  attr_accessor :cells

  def initialize
    reset!
  end

  def reset!
    @cells = Array.new(9, " ")
  end

  def display
    puts " #{cells[0]} | #{cells[1]} | #{cells[2]} "
      puts "-----------"
      puts " #{cells[3]} | #{cells[4]} | #{cells[5]} "
      puts "-----------"
      puts " #{cells[6]} | #{cells[7]} | #{cells[8]} "
    end

    def position(input)
      cells[input.to_i-1]
    end

    def full?
      cells.all?{|token| token == "X" || token == "O"}
    end

    def turn_count
      cells.count{|token| token == "X" || token == "O"}
    end
    # def turn_count
    #   turns = 0
    #   cells.each do |token|
    #     if token == "X" || token == "O"
    #       turns += 1
    #     end
    #   end
    #   turns
    # end

    def taken?(input)
      !(position(input) == " " || position(input) == "")
    end

    def valid_move?(input)
      input.to_i.between?(1,9) && !taken?(input)
    end

    def update(input, player)
      cells[input.to_i-1] = player.token
    end
    # def move(board, index, current_player)
    #   board[index] = current_player
    # end
end
# WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [2,4,6], [0,4,8]]
#
# board = [" "," "," "," "," "," "," "," "," "]
#
# def display_board(board)
#   puts " #{board[0]} | #{board[1]} | #{board[2]} "
#   puts "-----------"
#   puts " #{board[3]} | #{board[4]} | #{board[5]} "
#   puts "-----------"
#   puts " #{board[6]} | #{board[7]} | #{board[8]} "
# end
