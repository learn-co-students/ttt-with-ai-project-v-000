require 'pry'

class Player::Computer < Player
  #not the best 
  def move(board)
    move = side(board)
    move = corner(board) unless corner(board).nil?
    move = center(board) unless center(board).nil?
    move = block_fork(board) unless block_fork(board).nil?
    1.upto(9) { |i| move =  fork(i, board) unless fork(i, board).nil? }
    1.upto(9) { |i| move =  block(i, board) unless block(i, board).nil? }
    1.upto(9) { |i| move = win(i, board) unless win(i, board).nil? }
    puts "Computer Moves to position #{move}"
    move.to_s 
  end

  def win(position, board)
    win = Game::WIN_COMBINATIONS.any? do |combo|
      combo.all? do |x|
        (board.cells[x] == token || x == position - 1) && board.valid_move?(position)
      end
    end
    win ? position : nil
  end

  def block(position, board)
    block = Game::WIN_COMBINATIONS.any? do |combo|
      combo.all? do |x| 
        (board.cells[x] == opponent_token || x == position - 1) && board.valid_move?(position)
      end
    end
    block ? position : nil
  end

  def fork(position, board)
    fork = Game::WIN_COMBINATIONS.map do |combo|
      setup = combo.map do |x|
        if board.cells[x] == token || x == position - 1
          true
        elsif board.cells[x] == " "
          " "
        else
          opponent_token
        end
      end
      setup.count(true) == 2 && setup.count(" ") == 1 ? true : false
    end
    fork.count(true) == 2 && board.valid_move?(position) ? position : nil
  end

  #block_fork hard coded needs work 
  def block_fork(board)
    if board.cells[0] == opponent_token && board.cells[8] == opponent_token
      return 2
    end
    if board.cells[2] == opponent_token && board.cells[6] == opponent_token
      return 2
    end
    if board.cells[5] == opponent_token && board.cells[7] == opponent_token
      return 3
    end
  end

  def center(board)
    board.valid_move?(5) ? 5 : nil
  end

  def corner(board)
    corners = [1,3,7,9]
    corners.find { |corner| board.valid_move?(corner) } 
  end

  def side(board)
    sides = [2,4,6,8]
    sides.find { |side| board.valid_move?(side) } 
  end

  def opponent_token
    token == "X" ? "O" : "X"
  end

end

