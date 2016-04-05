require 'pry'

class Player::Computer < Player
  include GameStatus::InstanceMethods

  def move(board)
    if !board.taken?("5")
      return "5"
    else
      best_move(board)
    end
  end
  
  def win_or_block(board, token)
    move = WIN_COMBINATIONS.detect do |combo| 
      [board.cells[combo[0]],board.cells[combo[1]],board.cells[combo[2]]] == [token, token, ' '] ||
      [board.cells[combo[0]],board.cells[combo[1]],board.cells[combo[2]]] == [token, ' ', token] ||
      [board.cells[combo[0]],board.cells[combo[1]],board.cells[combo[2]]] == [' ', token, token]
    end

    move
  end 
  
  def best_move(board)
    token = self.token
    opponent = token == 'X' ? 'O' : 'X'
    
    win_move = win_or_block(board, token)
    block_move = win_or_block(board, opponent)

    if win_move && [board.cells[win_move[0]], board.cells[win_move[1]], board.cells[win_move[2]]].include?(token)
      move = win_move.detect{|cell| !board.taken?(cell)} 
    elsif block_move && [board.cells[block_move[0]], board.cells[block_move[1]], board.cells[block_move[2]]].include?(opponent)
      move = block_move.detect{|cell| !board.taken?(cell)}
    else
      move = " "
      board.cells.each_with_index{|cell, index| move = index if cell == " "}  
    end

    (move+1).to_s
  end
end