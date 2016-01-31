class Game

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    return @board.turn_count.even? ? @player_1 : @player_2
  end

  def over?
    draw? || won? ? true : false
  end

  def won?
    WIN_COMBINATIONS.each do |combination|
      pos_1 = combination[0]
      pos_2 = combination[1]
      pos_3 = combination[2]

      if @board.cells[pos_1] == "X" && @board.cells[pos_2] == "X" && @board.cells[pos_3] == "X"
        return player_1
      elsif @board.cells[pos_1] == "O" && @board.cells[pos_2] == "O" && @board.cells[pos_3] == "O"
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
      return winner.token
    else
      return nil
    end
  end

  def turn
    pos = current_player.move(@board)
    if @board.valid_move?(pos)
      @board.update(pos, current_player)
      return pos
    else
      turn
    end
  end

  def play
    while !over?
      puts "---------------------------------------------"
      @board.display
      puts "---------------------------------------------"
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
      @board.display
      return winner
    elsif draw?
      puts "Cats Game!"
      @board.display
      return "tie"
    end
  end

  def self.start
    puts "Welcome to Tic Tac Toe!"
    print "Do you want to play normal or wargames? "
    type = gets.chomp
    if type == "normal"
      game = get_human_count
      puts "Let's begin! X goes first!"
      game.play
    elsif type == "wargames"
      wargames
    else
      puts "Try again"
      start
    end
  end

  def wargames
    results = {x_wins: 0, o_wins: 0, ties: 0}
    100.times do
      game = Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
      result = game.play
      if result == "tie"
        results[:ties] += 1
      elsif result == "X"
        results[:x_wins] += 1
      elsif result == "Y"
        results[:o_wins]
      end
    end
    puts "#{results[:ties]} ties"
    puts "#{results[:x_wins]} wins for X"
    puts "#{results[:o_wins]} wins for O"
  end

  def get_human_count
    print "How many human players do you want to play with? Enter 0, 1, or 2: "
    humans = gets.chomp
    if humans == "0"
      return Game.new(Player::Computer.new("X"), Player::Computer.new("O"))
    elsif humans == "1"
      return human_or_computer_first
    elsif humans == "2"
      return Game.new
    else
      puts "Try again."
      get_human_count
    end
  end

  def human_or_computer_first
    print "Who should go first? Enter human or computer: "
    response = gets.chomp
    if response == "human"
      return Game.new(Player::Human.new("X"), Player::Computer.new("O"))
    elsif response == "computer"
      return Game.new(Player::Computer.new("X"), Player::Human.new("O"))
    else
      puts "Try again"
      human_or_computer_first
    end
  end

end