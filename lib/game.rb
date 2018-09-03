class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    # binding.pry
    players = [self.player_1, self.player_2].sort_by {|x| x.token}.reverse
    first_player = players[0]
    second_player = players[1]
    # if board.turn_count == 0
    #   first_player
    # else
      self.board.turn_count % 2 == 0 ? first_player : second_player
    # end
  end

  def won?
    WIN_COMBINATIONS.any? do |combo|
      a = self.board.cells[combo[0]]
      b = self.board.cells[combo[1]]
      c = self.board.cells[combo[2]]

      if (a == b) && (b == c) && (a != " ")
        return combo
      else
        nil
      end
    end
  end

  def draw?
    return true if !!self.won? == false && self.board.full?
  end

  def over?
    self.won? || self.draw?
  end

  def winner
    win_combo = self.won?
    self.won? ? self.board.cells[win_combo[0]] : nil
  end

  # def start
  #   puts "Welcome to Tic-Tac-Toe!"
  #   puts "Please select the number of players (0, 1, or 2):"
  #
  #   gets.strip
  #     if gets.strip == "0" || gets.strip == "1" || gets.strip == "2"
  #       num_players = gets.strip
  #     else
  #       puts "Invalid entry, please select the number of players (0, 1, or 2)."
  #       start
  #     end
  #
  #   puts "Will Player 1 or Player 2 be X? Please enter either 1 or 2:"
  #   gets.strip
  #     if gets.strip == "1" || gets.strip == "2"
  #       first_p = gets.strip
  #     else
  #       puts "Invalid entry."
  #       start
  #     end
  #       if num_players == "0"
  #         if first_p = "2"
  #           new_game = Game.new(Players::Computer.new("O"), Players::Computer.new("X"))
  #         else
  #           new_game = Game.new(Players::Computer.new("X"), Players::Computer.new("O"))
  #         end
  #       elsif num_players == "1"
  #         if first_p = "2"
  #           new_game = Game.new(Players::Human.new("O"), Players::Computer.new("X"))
  #         else
  #           new_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
  #         end
  #       else
  #         if first_p = "2"
  #           new_game = Game.new(Players::Human.new("O"), Players::Human.new("X"))
  #         else
  #           new_game = Game.new(Players::Human.new("X"), Players::Computer.new("O"))
  #         end
  #       end
  #     new_game.play
  #     "Would you like to play again? (y/n)"
  #     gets.strip
  #     if gets.strip == "y"
  #       start
  #     else
  #       "Thank you for playing Tic-Tac-Toe!"
  #       exit
  #     end
  #
  #   end

  def play
    self.turn until self.over?
    self.winner ? (puts "Congratulations #{self.winner}!") : (puts "Cat's Game!")
  end

  def turn
    puts "#{current_player.token}, you are up."
    # puts "Where will you play? (1-9)"
    player = self.current_player
    move = self.current_player.move(board)
    # binding.pry
    if self.board.valid_move?(move)
      self.board.update(move, player)
    else
      # binding.pry
      puts "Invalid entry received."
      turn
    end
    board.display
  end
end
