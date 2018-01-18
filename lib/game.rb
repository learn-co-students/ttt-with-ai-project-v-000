class Game
  attr_accessor :board, :player_1, :player_2

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  ::WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
  ]

  def call
    puts "Would you like to play with 0, 1, or 2 players?"
    input = gets.strip
    if input.to_i == 0
      @player_1 = Player::Computer.new("X")
      @player_2 = Player::Computer.new("O")
      play
    elsif input.to_i == 1
        puts "Should the first player, X, be a human or computer?"
        species = gets.strip
        if species.to_s.downcase == "human"
          @player_1 = Player::Human.new("X")
          @player_2 = Player::Computer.new("O")
          play
        elsif species.to_s.downcase == "computer"
          @player_1 = Player::Computer.new("X")
          play
        end
    elsif input.to_i == 2
      play
    end
  end

  def current_player
    @board.turn_count % 2 == 0 ? player_1 : player_2
  end

  def won?
    match = ::WIN_COMBINATIONS.select do |w|
      w.all? { |i| @board.cells[i] == "X" } || w.all? { |i| @board.cells[i] == "O"}
    end

    if match == []
      match = nil
    else
      match = match[0]
    end
  end

  def draw?
    if !won? && @board.full?
      true
    else
      false
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def winner
    if over? && won? != nil
      winning_combination = won?
      @board.cells[winning_combination[0]]
    else
      nil
    end
  end

  def turn
    input = current_player.move(@board)
    if @board.valid_move?(input)
      @board.update(input, current_player)
    else
    "invalid"
     input = current_player.move(@board)
    end
    @board.display
  end

  def play
    until over?
      turn
    end

    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cat's Game!"
    end
  end
end
