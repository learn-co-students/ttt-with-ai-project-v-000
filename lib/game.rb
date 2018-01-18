class Game

  attr_accessor :board, :player_1, :player_2


  def initialize (player_1 = Player::Human.new("X"), player_2 = Player::Human.new("O"), board = Board.new)
    @player_1 = player_1
    @player_2 = player_2
    @board = board
    
  end


# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [
    [0, 1, 2],  #Top row
    [3, 4, 5],  #Middle row
    [6, 7, 8],  #Bottom row
    [0, 3, 6],  #Left column
    [1, 4, 7],  #Middle column
    [2, 5, 8],  #Right column
    [0, 4, 8],  #First diagonal
    [6, 4, 2]   #Second diagonal
    ]

  def current_player
    board.turn_count % 2 == 0 ? player_1 : player_2
  end


    def won?
      WIN_COMBINATIONS.each do |win_combination|
        win_index_1 = win_combination[0]
        win_index_2 = win_combination[1]
        win_index_3 = win_combination[2]

        position_1 = board.cells[win_index_1]  #load the value of the board at win  _index_1
        position_2 = board.cells[win_index_2]  #load the value of the board at win_index_2
        position_3 = board.cells[win_index_3]  #load the value of the board at win_index_3

        if position_1 == "X" && position_2 == "X" && position_3 == "X"
          return win_combination    #return the win_combination indexes that won
        elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
          return win_combination    #return the win_combination indexes that won
        else false
        end
      end
    return false
    end



  def full?
    !board.cells.include?(" ")
  end


  def draw?
    if won?
      false
    elsif full?
      true
    else
      false
    end
  end



  def over?
    if self.draw? || self.won? || self. full?
      true
    else
      false
    end
  end


  def winner
    if won? == false
      nil
    else
      winner = won?[1]
      winner = board.cells[winner]
     end
  end



  #def move(giraffe)
  #  puts "Please select a square (1-9)"
  #  input = gets.chomp
  #  input
  #end

  def turn
    player = current_player
    move = player.move(board)
    if board.valid_move?(move)
      board.update(move, player)
    else
      turn
    end
    #display_board
  end


  def play
    board.display
    until over?
      turn
      board.display
    end
    if won?
      if winner == "X"
        puts "Congratulations X!"
      else
        puts "Congratulations O!"
      end
    else
      puts "Cats Game!"
    end
  end





end