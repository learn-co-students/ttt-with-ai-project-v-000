class Game
  attr_accessor :board, :player_1, :player_2

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

  def initialize(player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    board.turn_count.even?? player_1 : player_2
  end

  def over?
    won? || draw?
  end

  def won?
    WIN_COMBINATIONS.find do |array|
      player_1_won = array.all?{|cell| board.cells[cell] == player_1.token}
      player_2_won = array.all?{|cell| board.cells[cell] == player_2.token}
      player_1_won || player_2_won
    end
  end

  def draw?
    board.full? && !won?
  end

  def winner
    if won?
      board.cells[won?[0]]
    else
      won?
    end
  end

  def turn
    input = nil
    loop do
      input = current_player.move(board)
      if board.valid_move?(input)
        board.update(input, current_player)
        break
      end
    end
    input
  end

  def play
    until over? do
      turn
      puts board.display
    end
    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cats Game!"
    end
    won?
  end

  def self.start
    players = nil
    loop do
      puts "What kind of game do you want to play (0, 1, or 2 player?)"
      input = gets.strip
      if input == "0" || input == "1" || input == "2"
        players = input.to_i
        break
      elsif input == "wargames"
        players = -1
        break
      end
    end
    first = nil
    if players == 1
      loop do
        puts "Who should go first and be X?"  
        input = gets.strip
        if input == "1" || input == "2"
          first = input.to_i
          break
        end      
      end
    end
    case players
      when -1
        wins = 0
        100.times do
          wins += 1 if Game.new(Player::Computer.new("X"), Player::Computer.new("O"), Board.new).play
        end
        puts "The computer played itself 100 times and the game was won #{wins} times."
      when 0
        Game.new(Player::Computer.new("X"), Player::Computer.new("O"), Board.new).play
      when 1
        case first
        when 1
          Game.new(Player::Human.new("X"), Player::Computer.new("O"), Board.new).play
        when 2
          Game.new(Player::Computer.new("X"), Player::Human.new("O"), Board.new).play
        end
      when 2
        Game.new(Player::Human.new("X"), Player::Human.new("O"), Board.new).play
    end
    loop do
      puts "Would you like to play again?"
      input = gets.strip.downcase
      if input == "yes" || input == "y"
        self.start
        break
      elsif input == "no" || input == "n"
        break
      end
    end
  end

end