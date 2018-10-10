class Game
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

  
  def initialize(player_1 = nil, player_2 = nil, board = nil)
    @board = board
    @player_1 = player_1
    @player_2 = player_2
    
    if board == nil
      @board = Board.new
    end
    if player_1 == nil
      @player_1 = Players::Human.new("X")
    end
    if player_2 == nil
      @player_2 = Players::Human.new("O")
    end
  end
  
  def current_player
    n = self.board.turn_count
    if n % 2 == 0
      @player_1
    else @player_2
    end
  end

  def won?
    WIN_COMBINATIONS.each do |win_combination|
        if win_combination.all? { |n| self.board.cells[n] == "X" } || win_combination.all? { |n| self.board.cells[n] == "O" }
          return win_combination
        end
    end
    
    if self.board.cells.none? { |n| n == "X" or "O" }
      return false
    end
  end
  
  def draw?
    if !self.won? && self.board.full?
      true
    end
  end
  
  def over?
    if self.won? || self.draw?
      true
    end
  end
  
  def winner
    WIN_COMBINATIONS.each do |win_combination|
      if win_combination.all? { |n| self.board.cells[n] == "X" }
        return "X"
      elsif win_combination.all? {  |n| self.board.cells[n] == "O" }
        return "O"
      end
    end
    
    if !won?
      return nil
    end
  end
  
  def start
  end
  
  def play
    while !over?
      turn
     
    end
    # binding.pry
    #   it 'plays the first turn of the game' do
    #   game = Game.new
    #   allow($stdout).to receive(:puts)
    #   allow(game.player_1).to receive(:gets).and_return("1")

    #   allow(game).to receive(:over?).and_return(false, true)

    #   game.play

    #   expect(game.board.cells).to eq(["X", " ", " ", " ", " ", " ", " ", " ", " "])
    # end
    
    
    # if won?
    #   puts "Congratulations #{winner}!"
    # elsif draw?
    #   puts "Cat's game!"  
    # end
    
  end
  
  def turn
    n = self.current_player.move(self.board)
    self.board.update(n, current_player)
    # binding.pry
  end

  def board
    @board
  end
end