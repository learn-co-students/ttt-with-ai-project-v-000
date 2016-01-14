class Game 

  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]

  attr_accessor :board, :player_1, :player_2

  def initialize (player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
  end

  def current_player
    @board.turn_count.even? ? player_1 : player_2
  end

  def over?
    won? || draw? || board.full? ? true : false
  end

  def draw?
    !won? && board.full? ? true : false
  end

  def full?
  end

  def won?
    WIN_COMBINATIONS.each do |win_combo|
      win_index_1 = win_combo[0]
      win_index_2 = win_combo[1]
      win_index_3 = win_combo[2]

      position_1 = board.cells[win_index_1]
      position_2 = board.cells[win_index_2]
      position_3 = board.cells[win_index_3]
      if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
        return win_combo
      end
    end
    return false
  end

  def winner
    if won?
      board.cells[won?[0]]
    end
  end

  def turn
    if current_player == player_1
      puts "Player 1, your move!"
    else
      puts "Player 2, your move!"
    end
    board.display
    input = current_player.move(board)
    if board.valid_move?(input)
      board.update(input, current_player)
      board.display
      sleep(1)
    else
      puts "That is not a valid move."
      turn
    end
  end

  def play
    until over?
      turn
    end
    if winner
      puts "Congratulations #{winner}!"
      board.display
    elsif draw?
      puts "Cats Game!"
      board.display
    end
  end

  def start
    puts " " 
    puts "                         1 | 2 | 3 " 
    puts "                        -----------"
    puts "                         4 | 5 | 6 "
    puts "                        -----------"
    puts "                         7 | 8 | 9 "
    puts " " 
    puts "+--------------------------------------------------------+"
    puts "|                                                        |"
    puts "| Welcome to Tic Tac Toe! How many players? (0, 1, or 2) |"
    puts "|                                                        |"
    puts "+--------------------------------------------------------+"
    new_game = choose_players
    new_game.play
  end

  def choose_players
    players = gets.strip
    while players != '0' && players != '1' && players != '2'
      puts "Please enter 0, 1, or 2." 
      players = gets.strip
    end
    if players == '0'
      zero_players
    elsif players == '1'
      one_player
    elsif players == '2'
      two_players
    end
  end

  def zero_players
    puts "The computer will play itself!"
    Game.new(player_1=Player::Computer.new('X'), player_2=Player::Computer.new('O'))
  end

  def one_player
    puts "You are playing the computer! Who do you want to go first?"
    puts "Type 'me' or 'computer' :"
    choice = gets.strip
    while choice != 'me' && choice != 'computer'
      puts "Type 'me' or 'computer' :"
      choice = gets.strip
    end      
    if choice == 'me'
      puts "You are player 1, 'X'"
      Game.new(player_1=Player::Human.new('X'), player_2=Player::Computer.new('O'))
    else
      puts "You are player 2, 'O'"
      Game.new(player_2=Player::Computer.new('X'), player_2=Player::Human.new('O'))
    end
  end

  def two_players
    puts "Player 1, hit any key and press enter."
    gets
    puts "You are 'X', and will go first! Player 2 is 'O'."
    Game.new
  end
end

