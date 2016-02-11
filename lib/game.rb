class Game

  attr_accessor :board, :player_1, :player_2, :winner

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

  def initialize(player_1 = nil, player_2 = nil, board = nil) #assumes players and board are already initialized
    if player_1 == nil
      @player_1 = Human.new("X")
    else
      @player_1 = player_1
    end
    if player_2 == nil
      @player_2 = Human.new("O")
    else
      @player_2 = player_2
    end
    if board == nil
      @board = Board.new()
    else
      @board = board
    end
  end

  def winner
    won?
    @winner
  end

  def won?
    game_won = false
    WIN_COMBINATIONS.each do |win_combination|
      win_index_0 = win_combination[0]
      win_index_1 = win_combination[1]
      win_index_2 = win_combination[2]

      token_array = [self.board.cells[win_index_0], self.board.cells[win_index_1], self.board.cells[win_index_2]]
      if token_array.all? {|token| token == "X"}
        game_won = true
        self.winner = "X"
      elsif token_array.all?{|token| token == "O"}
        game_won = true
        self.winner = "O"
      end
    end
    return game_won
  end

  def draw?
    self.board.full? && !(self.won?)
  end

  def over?
    draw? || won?
  end

  def current_player
    if self.board.turn_count.even?
      return @player_1
    else
      return @player_2
    end
  end

  def turn
    input = self.current_player.move(self.board)
    until self.board.valid_move?(input)
      puts "Please enter a valid move (1-9): "
      input = self.current_player.move(self.board)
    end
    self.board.update(input, self.current_player)
  end

  def play
    until over?
      self.board.display
      turn
    end
    self.board.display
    if won?
      puts "Congratulations #{self.winner}!"
    end
    if draw?
      puts "Cats Game!"
    end
  end

end