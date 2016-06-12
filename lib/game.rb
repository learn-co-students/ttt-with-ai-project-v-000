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
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player #
   board.turn_count.even? ? player_1 : player_2
  end

  def won?
   WIN_COMBINATIONS.each do |win|
   position_1 = board.cells[win[0]]
   position_2 = board.cells[win[1]]
   position_3 = board.cells[win[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win
        end
      end
    return false
  end

  def full?
    board.cells.all? {|position| position == "X" || position == "O"}
  end

  def draw?
    @board.full? && !won?
  end


  def over?
    won? != false || draw? == true
  end

  def winner
    if winning_combo = won?
      winner = @board.cells[winning_combo.first]
    end
  end

  def turn
    player_move = current_player.move(board)
    if board.valid_move?(player_move)
      board.update(player_move, current_player)
    else
      turn
    end
  end

  def play
    until over?
      turn
    end
    if won?
      puts "Congratulations #{winner}!"
    elsif draw?
      puts "Cats Game!"
    end
  end

  def start
    @board.reset!
    puts "Welcome to Tic Tac Toe!"
    puts "Please choose number of players: 0, 1 or 2"
    input = gets.strip

    case input
    when "0"
      Game.new(Player::Computer.new("X"), Player::Computer.new("O")).play
    when "1"
      Game.new(Player::Human.new("X"), Player::Computer.new("O")).play
    when "2"
      Game.new(Player::Human.new("X"), Player::Human.new("O")).play
    else
      puts "Please choose correct number!"
      start
    end
    if @board.full? || @board.win
      puts "Whould you like to play again? y/n?"
      answer = gets.strip
      until (anwser == "y" || anwser == "n")
        puts "Please give a valid answer!"
      end
      if answer == "y"
        puts "Thank you for playing! Good luck!"
        @board.reset!
        start
      else
        puts "Have a nice day."
      end
    end
  end










end
