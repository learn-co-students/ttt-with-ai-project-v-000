class Game
  include Players

  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],
                      [0,3,6],[1,4,7],[2,5,8],
                      [0,4,8],[2,4,6]]

  def initialize(player_1 = Human.new("X"), player_2 = Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def self.start
    puts "Welcome to CLI Tic Tac Toe!"
    puts "How many players?"

    num_players = gets.strip
    case num_players
    when "0"
      new(Computer.new("X"), Computer.new("O"))
    when "1"
      puts "Are you 'X' or 'O'?"
      human_token = gets.strip
      if human_token == "X"
        new(Human.new("X"), Computer.new("O"))
      else
        new(Computer.new("X"), Human.new("O"))
      end
    when "2"
      new(Human.new("X"), Human.new("O"))
    end
  end

  def current_player
    if board.cells.count(player_1.token) > board.cells.count(player_2.token)
      player_2
    else
      player_1
    end
  end

  def won?
    cells = board.cells
    win = WIN_COMBINATIONS.select do |x|
      cells[x[0]] != " " &&
      cells[x[0]] == cells[x[1]] &&
      cells[x[1]] == cells[x[2]]
    end
    win.length > 0
  end

  def draw?
    !won? && !(board.cells.include?(" "))
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      x_moves = board.cells.count("X")
      o_moves = board.cells.count("O")
      x_moves > o_moves ? "X" : "O"
    end
  end

  def turn
    move = current_player.move(board)
    ##solution with recursion
    # if board.valid_move?(move)
    #   board.update(move,current_player)
    # else
    #   turn
    # end
    until board.valid_move?(move)
      move = current_player.move(board)
      # if !board.valid_move?(move)
      #   puts "invalid move"
      # end
    end
    board.update(move,current_player)
  end

  def play
    until over?
      turn
      board.display
      puts ""
    end

    if won?
      puts "Congratulations #{winner}!"
    else
      puts "Cat's Game!"
    end
  end

  def wargames
    x_wins = 0
    o_wins = 0
    draws = 0

    100.times do
      board.reset!

      until over?
      turn
      end

      if won?
        winner == "X" ? x_wins += 1 : o_wins += 1
      else
        draws += 1
      end
    end
    puts "X wins: #{x_wins}"
    puts "O wins: #{o_wins}"
    puts "Draws: #{draws}"
  end

  # def play
  #   turn
  #   board.display
  #   binding.pry
  #   if over?
  #     if won?
  #       puts "Congratulations #{winner}!"
  #     else
  #       puts "Cat's Game!"
  #     end
  #   else
  #     play
  #   end
  # end
end
