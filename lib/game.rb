class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [
   [0, 1, 2],
   [0, 3, 6],
   [0, 4, 8],
   [1, 4, 7],
   [2, 4, 6],
   [2, 5, 8],
   [3, 4, 5],
   [6, 7, 8]
  ]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    draw? || won? ? true : false
  end

  def won?
    WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
        return player_1
      elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
        return player_2
      end
    end
    return false
  end

  def draw?
    @board.full? && !won? ? true : false
  end

  def winner
    if winner = won?
      winner.token
    else
      nil
    end
  end

  def turn
    p = current_player.move(@board)
    if @board.valid_move?(p)
      @board.update(p, current_player)
      p
    else
      turn
    end
  end

  def play
    until over?
      @board.display
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
      @board.display
      winner
    elsif draw?
      puts "Cats Game!"
      @board.display
      "Cats Game"
    end
  end

  def self.start
    puts "How many players are there? (0-2) or do you want WARGAMES"
    players = gets.strip

    if players == "0"
      Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
    elsif players == "1"
      puts "Do you want to go first and be 'X'? (y/n)"
      first = gets.strip
      if first == "y" || first == "Y"
        Game.new(Player::Human.new("X"), Player::Computer.new("O"))
      else
        Game.new(Player::Computer.new("X"), Player::Human.new("O"))
      end
    elsif players == "2"
      puts "Which player will go first and be 'X'? (1 or 2)"
      first = gets.strip
      if first == "1"
        Game.new(Player::Human.new("X"), Player::Human.new("O"))
      else
        Game.new(Player::Human.new("O"), Player::Human.new("X"))
      end
    else
      start
    end
  end
end