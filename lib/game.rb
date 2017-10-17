require_relative './players/human.rb'
require_relative './players/computer.rb'

class Game
  WIN_COMBINATIONS = [[0,1,2],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2],[3,4,5]]
  attr_accessor :board, :player_1, :player_2, :winning_token
  def initialize(player1=Players::Human.new("X"), player2=Players::Human.new("O"),board=Board.new)
    @board=board
    @player_1=player1
    @player_2=player2

  end


  def board
    @board
  end

  def current_player
    turn_counter = self.board.turn_count
    if turn_counter.even?
      return self.player_1
    else
      return self.player_2
    end

  end

  def over?
    self.won? || self.draw?
  end

  def won?
    WIN_COMBINATIONS.each do |potential_win|
      if self.board.cells[potential_win[0]] == self.board.cells[potential_win[1]] && self.board.cells[potential_win[1]] == self.board.cells[potential_win[2]] && self.board.cells[potential_win[1]]!=" "
        winning_array = potential_win
        @winning_token = self.board.cells[potential_win[0]]

        return winning_array

      end
    end
    return false
  end



  def draw?
    self.board.full? && !won?
  end

  def winner
    if won?
      @winning_token
    else
      return nil
    end
  end

  def turn
    puts "It is your turn player #{self.current_player.token}. Where would you like to go?"
    input=self.current_player.move(self.board.cells)

    if self.board.valid_move?(input)
      self.board.update(input, self.current_player)
      self.board.display
   else
      puts "That is not a valid move, try again."
      self.turn
    end


  end

  def play

    while !over?
      self.turn
    end
    if self.won?
      puts "Congratulations #{self.winner}!"
    elsif self.draw?
      puts "Cat's Game!"
    end
  end


    #  if self.draw?
    #    puts "Cat's Game!"
    #  end
    #  puts
    #else
      #self.play
    #end



end
