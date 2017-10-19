require './config/environment.rb'
require 'pry'
class Player::Computer < Player
  attr_accessor :position, :available_moves, :other_player
  def move(game, board)
    self.other_player = nil
    if game.current_player == game.player_1
      self.other_player = game.player_2
    elsif game.current_player == game.player_2
      self.other_player = game.player_1
    end
    self.available_moves = game.get_available_moves
    if available_moves.include?("5")
      self.position = "5"
    else
      index = win(board) || block(board) || corner(board) || (0..8).to_a.sample
      self.position = (index + 1).to_s
    end
  end

  def complete_combo?(board, token)
    Game::WIN_COMBINATIONS.detect do |win_combo|
      ((board.cells[win_combo[0]] == token && board.cells[win_combo[1]] == token) && !board.taken?(win_combo[2] + 1)) ||
      ((board.cells[win_combo[1]] == token && board.cells[win_combo[2]] == token) && !board.taken?(win_combo[0] + 1)) ||
      ((board.cells[win_combo[0]] == token && board.cells[win_combo[2]] == token) && !board.taken?(win_combo[1] + 1))
    end
  end

  def win(board)
    win_combo = complete_combo?(board, self.token)
    if win_combo
      win_combo.detect{|index| !board.taken?(index+1)}
    end
  end


  def corner(board)
    [0, 2, 6, 8].detect {|index| !board.taken?(index + 1)}
  end

  def block(board)
    block_combo = complete_combo?(board, self.other_player.token)
    if block_combo
      block_combo.detect{|index| !board.taken?(index + 1)}
    end
  end
end