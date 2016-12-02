class Game

  attr_accessor :board, :player_1, :player_2

  @winner = nil

  def initialize(player_1=Players::Human.new("X"), player_2=Players::Human.new("O"), board=Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [2,4,6],
    [0,4,8],
  ]

  def current_player
    self.board.turn_count.odd? ? self.player_2 : self.player_1
  end

  def over?
    self.draw? || self.won?
  end

  def won?
    outcome = false
    the_board = self.board.cells
    for combo in WIN_COMBINATIONS
      if the_board[combo[0]] != " " && the_board[combo[0]] == the_board[combo[1]] && the_board[combo[0]] == the_board[combo[2]]
        outcome = true
      end
    end
    outcome
  end

  def draw?
    board.full? && !won?
  end

  def winner
    winner = nil
    the_board = self.board.cells
    for combo in WIN_COMBINATIONS
      if the_board[combo[0]] != " " && the_board[combo[0]] == the_board[combo[1]] && the_board[combo[0]] == the_board[combo[2]]
        winner = the_board[combo[0]]
      end
    end
    winner
  end

  def turn
    input = nil
    while self.board.valid_move?(input) == false
      input = self.current_player.move(board)
    end
      self.board.update(input, self.current_player)
  end

  def play
    turn until over?
      if self.draw?
        puts "Cats Game!"
      elsif self.won?
        puts "Congratulations #{winner[0]}!"
      end
    end
  end
