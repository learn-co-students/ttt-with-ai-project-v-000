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
    [6, 4, 2]
  ]

  def initialize(player_1 = Players::Human.new('X'), player_2 = Players::Human.new('O'), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    turn = self.board.turn_count
    turn % 2 == 0 ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.each do |winner|
      # binding.pry
      if winner.all? {|index| self.board.taken?(index.to_i + 1)}
        position1 = self.board.cells[winner[0]]
        position2 = self.board.cells[winner[1]]
        position3 = self.board.cells[winner[2]]

        if position1 == position2 && position1 == position3
          return winner
        end
      end
    end
    return false
  end

  def draw?
    if self.board.full? && !self.won?
      return true
    end
  end

  def over?
    self.won? || self.draw? ? true : false
  end

  def winner
    winner = self.won?
    winner ? self.board.cells[winner[0]] : nil
  end

  def turn
    input = ""
    player = self.current_player

    until self.board.valid_move?(input)
      input = player.move(self.board)
    end
    self.board.update(input, player)
    board.display
    return input
  end

  def play
    board.display
    while !self.over?
      self.turn
    end

    if draw?
      puts "Cat's Game!"
      board.display
    else
      winner = self.winner
      puts "Congratulations #{winner}!"
      puts "Final board:"
      board.display
    end
  end

  def self.start
    players = ""
    until players == "0" || players == "1" || players == "2"
      puts "0, 1 or 2 players?"
      players = gets.strip
    end

    if players == "0"
      first_player = "computer"
    elsif players == "1"
      puts "Do you want to be 'X' or 'O'? Type X or O."
      first_player = gets.strip
    elsif players == "2"
      first_player == "human"
    end

    if players == "0"
      player_1 = Players::Computer.new('X')
      player_2 = Players::Computer.new('O')
    elsif players == "1"
      if first_player == "O" || first_player == "o"
        player_1 = Players::Computer.new('X')
        player_2 = Players::Human.new('O')
      elsif first_player == "X" || first_player == "x"
        player_1 = Players::Human.new('X')
        player_2 = Players::Computer.new('O')
      end
    elsif players == "2"
      player_1 = Players::Human.new('X')
      player_2 = Players::Human.new('O')
    end
    new_game = Game.new(player_1, player_2)
  end
end
