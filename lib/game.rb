class Game
  attr_accessor :player_1, :player_2, :board

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

  def initialize(p1 = Players::Human.new("X"), p2 = Players::Human.new("O"), play_board = Board.new)

    @board = play_board

    @player_1 = p1
    
    @player_2 = p2

  end



  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def opposing_player
    board.turn_count.odd? ? player_1 : player_2
  end



  def won?
    WIN_COMBINATIONS.detect do |combo|
      board.taken?(combo[0] + 1) && board.cells[combo[0]] == board.cells[combo[1]] && board.cells[combo[1]] == board.cells[combo[2]]
    end    
  end



  def draw?
    board.full? && ! won?
  end



  def over?
    draw? || won?
  end



  def winner
    board.cells[won?[0]] if won?
  end



  def turn
    board.display
    if current_player.is_a? Players::Human
      puts ""
      puts "Where would you like to move, #{current_player.token}? (1-9)"
    end
  
    input = current_player.move(board)
    
    until board.valid_move?(input)
      puts ""
      if input.to_i.between?(1,9)
        puts "Sorry, #{current_player.token}. That spot's taken!"
      else
        puts "Sorry. Please enter a valid number (1-9)."
      end

      if current_player.is_a? Players::Human
      puts "Where would you like to move, #{current_player.token}? (1-9)"
      end

      input = current_player.move(board)
    end

    puts ""
    puts ""
        
    board.update(input, current_player)

    if player_1.class == Players::Computer &&
      player_2.class == Players::Computer

      sleep(0.66)
    end
    
  end



  def play

    until over?
      turn
    end
    
    if won?
      board.display
      puts ""
      puts "Congratulations #{winner}!"
      puts ""
      puts ""
    else
      board.display
      puts ""
      puts "Cat's Game!"
      puts ""
      puts ""
    end
    
  end
  


end
