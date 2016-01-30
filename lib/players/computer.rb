require 'pry'
class Computer < Player
  attr_reader :valid_moves

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


  def move(board)
    board.display
    @valid_moves = []
    board.cells.each_with_index do |value, index| 
      @valid_moves << ("#{index + 1}".to_s) if value == " "
    end
    sleep(1)
    @valid_moves.sample
  end

  def potential_win_combinations(board)
    self.token == "X" ? opponent_token = "O" : opponent_token = "X" 
    win_combinations = []
    WIN_COMBINATIONS.each_with_index do |combo, index|
      combo = board.get_cells(combo)
      combo.include?(opponent_token) ? next : win_combinations << index
    end
    win_combinations
  end

  def potential_defeat_combinations(board)
    self.token == "X" ? opponent_token = "O" : opponent_token = "X" 
    defeat_combinations = []
    WIN_COMBINATIONS.each_with_index do |combo, index|
      combo = board.get_cells(combo)
      combo.include?(self.token) ? next : defeat_combinations << index
    end
    defeat_combinations
  end

  def critical_win_combinations(potentials, board)
    critical_combinations = []
    potentials.each_with_index do |potential, index|
      potential = board.get_cells(WIN_COMBINATIONS[potential]) 
      critical_combinations << index if potential.count(self.token) == 2 
    end
    critical_combinations
  end

  def critical_defeat_combinations(potentials, board)
    self.token == "X" ? opponent_token = "O" : opponent_token = "X" 
    critical_combinations = []
    potentials.each_with_index do |potential, index|
      potential = board.get_cells(WIN_COMBINATIONS[potential]) 
      critical_combinations << index if potential.count(opponent_token) == 2 
    end
    critical_combinations
  end
end
