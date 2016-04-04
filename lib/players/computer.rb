require 'pry'
class Player::Computer < Player
  include GameStatus::InstanceMethods
  attr_accessor :current_player


  def move(board)
    if !board.taken?("5")
      "5"
    end
    best_move(board)
  end
  
  def win_or_block(board, token)
    move = WIN_COMBINATIONS.find do |combo|
    (
    [board.cells[combo[0]],board.cells[combo[1]],board.cells[combo[2]]] ==
    [token, token, ' ']
    ) ||
    (
    [board.cells[combo[0]],board.cells[combo[1]],board.cells[combo[2]]] ==
    [token, ' ', token]
    ) ||
    (
    [board.cells[combo[0]],board.cells[combo[1]],board.cells[combo[2]]] ==
    [' ', token, token]
    )
    end
    move
  end 
  
  def best_move(board)
    opponent = token == 'X' ? 'O' : 'X'
    token = self.token
    
    priority_move = win_or_block(board, token)
    board_cells = [board.cells[priority_move[0]], board.cells[priority_move[1]], board.cells[priority_move[2]]] unless priority_move.nil?

    if priority_move && board_cells.include?(token)
      move = priority_move.find{|cell| board.cells[cell]==' '} 
    elsif priority_move && board_cells.include?(opponent)
      move = priority_move.find{|cell| board.cells[cell]==' '}
    else
      move = board.cells.find{|cell| board.cells[cell]==' '}
    end
   
    (move + 1).to_s
  end
end