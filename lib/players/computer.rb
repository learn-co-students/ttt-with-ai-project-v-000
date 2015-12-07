require 'pry'
require_all 'lib'


class Player::Computer < Player

  attr_accessor :board
    WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]


  # BLOCK_COMBINATIONS=[
  #   [0,1],
  #   [3,4],
  #   [6,7],
  #   [0,3],
  #   [1,4],
  #   [2,5],
  #   [0,4],
  #   [6,4],
  #   [2,4],
  #   [8,4],
  #   [2,1],
  #   [5,4],
  #   [8,7],
  #   [3,6],
  #   [7,4],
  #   [8,5]

  #   ]

  def move(board)
    num = (1..9).to_a.sample   
      if board.valid_move?(num)
        num
      end 

  end 

  def defense_move
  # binding.pry
  WIN_COMBINATIONS.select do|index| 
    
        board.cells[index[0]] == 'X' && board.cells[index[1]] == 'X' ||
        
        board.cells[index[1]] == 'X' && board.cells[index[2]] == 'X' ||
        board.cells[index[0]] == 'X' && board.cells[index[2]] == 'X' ||
        board.cells[index[0]] == 'O' && board.cells[index[1]] == 'O' ||
        board.cells[index[1]] == 'O' && board.cells[index[2]] == 'O' ||
        board.cells[index[0]] == 'O' && board.cells[index[2]] == 'O'
          
    end 
  end

  # def defense_move
  #   if opponent_close
  # end 







end 

aaron=Player::Human.new("X")
computer =Player::Computer.new("O")
board = Board.new
binding.pry
computer.move(board)
computer.opponent_close



