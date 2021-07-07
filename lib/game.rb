class Game
  attr_accessor :board, :player_1, :player_2

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8],
  [0,3,6], [1,4,7], [2,5,8],
  [0,4,8], [2,4,6]]

  def initialize(player_1 = Players::Human.new("X"), player_2 = Players::Human.new("O"), board = Board.new)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end

  def current_player
    board.turn_count.even? ? player_1 : player_2
  end

  def won?
    WIN_COMBINATIONS.detect do |win_com|
      board.cells[win_com[0]] == board.cells[win_com[1]] && board.cells[win_com[1]] == board.cells[win_com[2]] && board.cells[win_com[0]] != " "
    #   if board.cells[win_index[0]] == "X" && board.cells[win_index[1]] == "X" && board.cells[win_index[2]] == "X"
    #     return win_index
    #   elsif board.cells[win_index[0]] == "O" && board.cells[win_index[1]] == "O" && board.cells[win_index[2]] == "O"
    #     return win_index
    #   end
    end
    # false
  end

  def draw?
    !won? && board.full?
  end

  def over?
    won? || draw?
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    puts "Your turn #{current_player.token}"
    u_i = current_player.move(board)
    if board.valid_move?(u_i)
      board.update(u_i, current_player)
    else
      puts "That spot is already taken. Try again."
      turn
    end
  end

  def play
    until over?
    turn
    end
    if won?
      if winner == "X"
        puts "Congratulations X!"
      elsif winner == "O"
        puts "Congratulations O!"
      end
    elsif draw?
      puts "Cat's Game!"
    end
  end

  def start
    puts "How many players? Please enter: 0, 1, or 2"
    u_i = gets.strip
    case u_i
    when "0"
      Game.new(Players::Computer.new("X"), Players::Computer.new("O")).play
    when "1"
      Game.new(Players::Human.new("X"), Players::Computer.new("O")).play
    when "2"
      Game.new(Players::Human.new("X"), Players::Human.new("O")).play
    else
      puts "Invalid Entry"
      start

    end
  end


end
