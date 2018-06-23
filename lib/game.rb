# require "pry"
class Game < Board

attr_accessor :board, :player_1, :player_2
  
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
  

  
  def initialize(p1 = Human.new("X"), p2 = Human.new("O"), b = Board.new)
    self.player_1 = p1
    self.player_2 = p2
    self.board = b
  end

  def current_player
    if self.board.turn_count.odd? == true
      player_2
    else
      player_1
    end
  end

  def over?
    if self.won?
      return true
    elsif self.draw?
      return true
    else
      return false
    end
  end
      



  def won?
    WIN_COMBINATIONS.each do |combo| 
      if self.board.cells[combo[0]] != " " && self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]]
        return true
      end
    end
    false
  end

  def draw?
    if self.board.full? == true && self.won? == false
      return true
    else
      return false
    end
  end

  def winner
    if self.won? == true
      win_combo = WIN_COMBINATIONS.detect do |combo| 
        self.board.cells[combo[0]] != " " && self.board.cells[combo[0]] == self.board.cells[combo[1]] && self.board.cells[combo[1]] == self.board.cells[combo[2]]
      end
      return self.board.cells[win_combo[0]]
    else 
      return nil
    end
  end

  def turn
    
    player = self.current_player 
    if player.class == Human
      puts "#{player.token}, make a move."
    end
    response = player.move(board)
    while self.board.valid_move?(response) == false
      # binding.pry
      puts "#{player.token}, that was not a valid move. Try again."
      response = player.move(board)
    end

      self.board.position(response)

      self.board.update(response,player)
      self.board.display
      

  end


  def play
    while over? != true
      turn
    end
    if won?
      board.display
      puts "Congratulations #{winner}!"
    elsif draw?
      board.display
      puts "Cats Game!"
    end
  end

  def start
  end
end