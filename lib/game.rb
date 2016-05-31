class Game
  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  attr_accessor :board, :player_1, :player_2, :token, :save_winner

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @save_winner = " "
  end

  def current_player
    self.board.turn_count.even? ?
    player_1 : player_2
  end

  def over?
    draw? || won?
  end

  def won?
    won = false
    WIN_COMBINATIONS.each_with_index do |win_combo, index|
      if self.board.cells[win_combo[0]] == self.board.cells[win_combo[1]] && self.board.cells[win_combo[0]] == self.board.cells[win_combo[2]] && self.board.cells[win_combo[2]] == self.board.cells[win_combo[2]] && self.board.cells[win_combo[0]] != " "
        won = true
        self.save_winner = self.board.cells[win_combo[0]]
      end
    end
    won
  end

  def draw?
    self.board.full? && !won?
  end

  def winner
    self.save_winner if won?
  end

  def turn
    self.board.display
    puts "\n \n"
    input = current_player.move(board)
    if self.board.valid_move?(input)
      self.board.update(input, current_player)
      current_player
    else
      puts "***Your input is not valid.*** \n1 is top row, left-most cell and 9 is bottom row right-most cell.\n\n"
      input = current_player.move(board)
      self.board.update(input, current_player)
      current_player
    end
  end

  def play
    until over?
      turn
    end
    puts "\n\n"
    self.board.display
    puts "\n\n"
    puts "Congratulations #{self.save_winner}!" if won?
    puts "Cats Game!" if draw?
    play_again? if over?
  end


  def help
    puts "To play Tic-Tac-Toe, the first player, \"X\", will start by inputing 1 to 9 indicating their choice of placement on the board below. \n\nThe board is labeled with 1 to 9 to demonstrate the player's options. \n \n"
    board_display = " " + "1" + " | " + "2" + " | " + "3" + " \n" +
                    "-----------" + "\n" +
                    " " + "4" + " | " + "5" + " | " + "6" + " \n" +
                    "-----------" + "\n" +
                    " " + "7" + " | " + "8" + " | " + "9" + " " + "\n\n"
    puts board_display
    puts "The goal is to get three of your tokens in the same row, column, or diagonal.\n\n"
    play
  end

  def play_again?
    puts "Would you like to play again? Enter Y to play again or N to exit."
    input = gets.strip.downcase
    case input
      when "y"
        TicTacToe.new
      when "n"
        exit
      else
        play_again?
    end
  end

end
