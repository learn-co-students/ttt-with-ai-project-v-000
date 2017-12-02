class Game
include Players

attr_accessor :board, :player_1, :player_2
  WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ]

  def initialize(player_1=(Human.new("X")), player_2=(Human.new("O")), board=(Board.new))
    @board = board
    @player_1 = player_1
    @player_2 = player_2
  end #initialize

  def won? #returns FALSE OR winning line array (called by #winner)
    any_return = WIN_COMBINATIONS.any? do |combo|
      @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X" ||
        @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
    end
      select_return =  WIN_COMBINATIONS.select do |combo|
        @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X" ||
          @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
    end
    if any_return == false
      any_return
    elsif select_return != nil
      win_return = select_return[0]
    end
  end #won?

  def draw? #is current board full but not won?
      @board.full? == true && won? == false
  end #draw?

  def winner #returns winning line array
    if won? != false
      win_line = won?
      @board.cells[win_line[0]]
    end
  end #winner

  def current_player
    if (@board.turn_count % 2) == 0
        @player_1
      elsif (@board.turn_count % 2) != 0
        @player_2
      end
  end #current_player

  def over? #come back to this, passes but not the same as OOTTT
    @board.full?
  end #over

#take a break, this won't work until there's a #move defined for all players.
  def turn
    puts "Please select an empty space in which to move, player #{current_player}, 1-9."
    @board.display
    move = @current_player.move(@board) #can't call repeatedly, need one instance
    while !@board.valid_move?(move)
      puts "Invalid Move."
      turn #'til Human gets it right
    end
    @board.update(move, current_player)
    puts "Updated Board:"
    @board.display


  end #turn



  #index = input_to_index(user_input)
  def turn2
    input = current_player.move
    char = current_player
    index = input.to_i -1
    if @board.valid_move?(index)
        @board.update(index, char)
    else turn
    end
    @board.display
  end


end #END GAME CLASS
