class Game
  attr_accessor :board, :player_1, :player_2, :wargames, :games_played

  WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new, wargames = false)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    @wargames = wargames
    @games_played = 0
  end

  def current_player
    if board.turn_count % 2 == 0
      player_1
    else
      player_2
    end
  end

  def over?
    if board.full? || won? != false || draw?
      true
    else
      false
    end
  end

  def won?
    WIN_COMBINATIONS.each {|combo|
      if combo.all? { |cell| board.cells[cell] == "X" } || combo.all? { |cell| board.cells[cell] == "O" }
        return combo
      end
    }
    false
  end

  def draw?
    if board.full? && !won?
      true
    else
      false
    end
  end

  def winner
    won? != false ? board.cells[won?[0]] : nil
  end

  def turn
    input = current_player.move(board)
    if !board.valid_move?(input)
      puts "Please enter a valid move."
      turn
    else
      if (current_player.instance_of? Players::Computer) && !wargames
        sleep(0.5)
        puts " "
        puts "Thinking..."
        sleep(1)
        puts "Done!"
        puts " "
        sleep(1)
      end
      board.update(input, current_player)
    end
  end

  def play
    if won? != false
      board.display
      puts ""
      puts "Congratulations #{winner}!"
    elsif draw?
      board.display
      puts ""
      puts "Cat's Game!"
      if wargames && games_played < 100
        puts ""
        puts ""
        puts "WINNER: NONE"
        puts ""
        puts ""
        board.reset!
        @games_played += 1
        play
      elsif wargames && games_played == 100
        rocket
      end
    end

    if over? != true
      turn
      play
    end
  end

  def rocket
    puts ""
    sleep(0.5)
    puts "WINNER: NONE"
    sleep(0.5)
    puts "                /\\"
    sleep(0.5)
    puts "               (  )"
    sleep(0.5)
    puts "               (  )"
    sleep(0.5)
    puts "              /|/\\|\\"
    sleep(0.5)
    puts "             /_||||_\\"
    sleep(0.5)
    puts ""
    puts "THE ONLY WINNING MOVE IS NOT TO PLAY"
    sleep(1)
    puts "HOW ABOUT A NICE GAME OF CHESS?"
  end
end
