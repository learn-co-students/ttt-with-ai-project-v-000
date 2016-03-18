

class Game

  attr_accessor :board, :player_1, :player_2, :token, :cells, :move, :player
 

  
  WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [2,4,6]]
  def initialize(player_1 = "X", player_2 = "O", board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])
    if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
      @board = Board.new
    else
      @board = board
    end
    if player_1 == "X"
      @player_1 = Player::Human.new(player_1)
      @player_1.board = @board
    else
      @player_1 = player_1
      @player_1.board = @board
    end
    if player_2 == "O"
      @player_2 = Player::Human.new(player_2)
      @player_2.board = @board
    else
      @player_2 = player_2
      @player_2.board = @board
    end

  end


  def current_player
    if @board.turn_count == 0
      return @player_1
    elsif @board.turn_count % 2 != 0
      return @player_2
    else
      return @player_1
    end
  end

  def over?
    if !@board.cells.include?(" ") || won?
      return true
    else
      return false
    end
  end
  



  
  
  def draw?
    if !@board.cells.include?(" ") && !won?
      true
    else
      false
    end
  end

  def winner
    if !won?
      return nil
    elsif @board.cells.count("X") > @board.cells.count("O")
      return "X"
    elsif @board.cells.count("O") >= @board.cells.count("X")
      return "O"


    end
  end
  

  


  def won?
    status = false

    Game::WIN_COMBINATIONS.each do |combo|
      if @board.cells[combo[0]] == "X" && @board.cells[combo[1]] == "X" && @board.cells[combo[2]] == "X"
        
        status = true
        
        return status
      elsif @board.cells[combo[0]] == "O" && @board.cells[combo[1]] == "O" && @board.cells[combo[2]] == "O"
        status = true
        return status
      end

    end
    return status
  end


  def turn

    puts @board.display

    valid = false
    while valid == false
      

        player = current_player
        position = player.move(@board)
        
        if @board.valid_move?(position) == true
          
          @board.update(position,player)
          valid = true
        elsif @board.valid_move?(position) == false
          puts "Sorry that move wasn't valid. Try again."
        end
    end

  end


  def start
    puts "How many people will be playing? 1 or 2? Input WARGAMES or 0 for surprise."
    input = gets.strip
    if input == "2"
      play
    elsif input == "1"
      @player_2 = Player::Computer.new("O")
      play
    elsif input == "WARGAMES" || input == "0"
      @player_1 = Player::Computer.new("X")
      @player_2 = Player::Computer.new("O")
      100.times do
        play
        puts "---|-------------------|---"
        puts "---|Master of the House|---"
        puts "---|-------------------|---"
        sleep(0.5)
      end
    else
      puts "Sorry wrong entry. Try again."
      start
    end
  end

  def over?
    if won? || draw?
      true
    else
      false
    end
  end

  def play
    

    while !over?
      turn
    end

    if draw?
      puts "Cats Game!"
    elsif won? && winner == "X"
      puts "Congratulations X!"
    elsif won? && winner == "O"
      puts "Congratulations O!"
    end
  end
      
  



end


