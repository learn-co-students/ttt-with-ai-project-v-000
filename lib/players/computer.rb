require 'pry'

class Player::Computer < Player

  def move(board)
    # accepts a board and returns the move the 
    # computer wants to make in the form of a 1-9 string.
    if available_spaces(board).include?(5)
      "5"
    else
      best_move(board)
    end
  end

  def best_move(board)
    win(board) || block(board) || corner_move(board) || random_move(board)
  end

  def available_spaces(board)
    board.cells.map.with_index do |space, index|
      index+1 if space == " "
    end
  end

  def corner_move_open?(board)
    available_spaces(board).any? {|i| [1,3,7,9].include? i}
  end

  def corner_move(board)
    if corner_move_open?(board)
      result = available_spaces(board).find do |available_space|
        available_space == 1 || available_space == 3 ||
        available_space == 7 || available_space == 9
      end
      puts "Corner move!"
      result
    end
  end

  def complete_combination(board, token)
    Game::WIN_COMBINATIONS.detect do |combination|
      (
        (board.cells[combination[0]] == token && board.cells[combination[1]] == token &&
          !board.taken?(combination[2]+1)
        ) ||
        (board.cells[combination[0]] == token && board.cells[combination[2]] == token &&
          !board.taken?(combination[1]+1)
        ) || 
        (board.cells[combination[1]] == token && board.cells[combination[2]] == token &&
          !board.taken?(combination[0]+1)
        )
      )
    end
  end

  def block(board)
    if complete_combo = complete_combination(board, self.opponent_token)
      complete_combo.each do |combo_array_item|
        if !board.taken?(combo_array_item+1)
          puts "Player #{self.opponent_token} has been blocked!"
          return combo_array_item+1
        end
      end
    end
  end

  def win(board)
    if complete_combo = complete_combination(board, self)
      complete_combo.each do |combo_array_item|
        if !board.taken?(combo_array_item+1)
          return combo_array_item+1
        end
      end
    end
  end

  def random_move(board)
    random_number = rand(0..8)
    if !board.taken?(rand(0..8)+1)
      random_number
    else
      random_move(board)
    end
  end

  def opponent_token
    self.token == "X" ? "O" : "X"
  end

end

