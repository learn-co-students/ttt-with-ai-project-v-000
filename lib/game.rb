require 'pry'

class Game

  attr_accessor :board,:player_1, :player_2
  attr_writer :winner



  WIN_COMBINATIONS = [
    [0,1,2], # Top row
    [3,4,5],  # Middle row
    [6,7,8],  # bottom row
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6],
    # ETC, an array for each win combination
  ]
  def initialize(player1 = Players::Human.new("X"), player2= Players::Human.new("O"), bord=Board.new)
    @player_1 = player1
    @player_2 = player2
    @board = bord

  end

  def current_player

    count = @board.turn_count
    if count % 2 == 0
      @player_1
    else
      @player_2
    end
  end
  def won?
    flag = false

    if @board.turn_count > 2
        WIN_COMBINATIONS.each do |combi|
          x_count = 0
          o_count = 0
          combi.each do |num|

            if @board.cells[num] == "X"
              x_count = x_count + 1
              if x_count == 3

                 flag = true
                 @winner = "X"
              end
            elsif @board.cells[num] == "O"
              o_count = o_count + 1
              if o_count == 3
                flag = true
                @winner = "O"
              end
            end #if board.cells
          end#combi
        end #WIN_COM
      end #if >5

      flag

  end #won?

  def draw?
    if @board.turn_count == 9
      if won? == false
        true
      else
        false
      end
    else
      false
    end
  end
  def over?

    if won? == true || draw? == true
      true
    else
      false
    end

  end
  def winner
    #binding.pry
    if over?
     if won?
       @winner
     end
    else
      nil

    end
end
def turn
  @board.display
  puts "#{current_player.token}'s turn :'"
  num = current_player.move(@board)
  #binding.pry
    if @board.valid_move?(num)
      @board.update(num, current_player)

    else
      turn
    end
  end

def play


  until over? == true
    turn
  end
  @board.display
  if won?
    puts "Congratulations #{@winner}!"
  elsif draw?
    puts "Cat's Game!"
  end


end


end
