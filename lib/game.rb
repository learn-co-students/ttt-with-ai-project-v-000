class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    self.board.turn_count % 2 == 1 ? self.player_2 : self.player_1
  end

  def over?
    won? || draw? || full?
  end

  def won?(board = self.board.cells)
    WIN_COMBINATIONS.each do |win_combination|
      position_1 = board[win_combination[0]]
      position_2 = board[win_combination[1]]
      position_3 = board[win_combination[2]]

      if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
        (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    return false
  end

  def full?(board = self.board.cells)
    board.any? do |space|
      if space == "" || space == " "
        return false
      end
    end
    return true
  end

  def draw?(board = self.board.cells)
    if won?(board)
      return false
    elsif full?(board)
      return true
    else
      return false
    end
  end

  def winner(board = self.board.cells)
    winning_index = won?
    if winning_index
      if board[winning_index[0]] == "X"
        return "X"
      elsif board[winning_index[0]] == "O"
        return "O"
      end
    else
      return nil
    end
  end

  def turn
    puts "Choose a space #{current_player.token}! (1-9)"
    input = ""
    until self.board.valid_move?(input)
      input = current_player.move(self.board)
    end
    self.board.update(input, current_player)
    self.board.display
    puts "Nice move!"
  end

  def play
    puts "Good luck, have fun!"
    self.board.display
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  WIN_COMBINATIONS = [
    [0,1,2], # top row win
    [3,4,5], # mid row win
    [6,7,8], # bot row win
    [0,3,6], # left col win
    [1,4,7], # mid col win
    [2,5,8], # right col win
    [0,4,8], # diag 1 win
    [2,4,6] # diag 2 win
  ]

end
