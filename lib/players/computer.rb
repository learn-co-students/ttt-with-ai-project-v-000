require 'pry'
class Computer < Player
  attr_reader :valid_moves

  WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]


  def move(board)
    board.display
    sleep(1)
    @valid_moves = []

    self.token == "X" ? opponent_token = "O" : opponent_token = "X" 
    potential_wins = get_potential_wins(board)
    potential_defeats = get_potential_defeats(board)
    critical_wins = get_critical_combinations(self.token, potential_wins, board)
    critical_defeats = get_critical_combinations(opponent_token, potential_defeats, board)

    if critical_wins.any?
      combination = critical_wins.sample
      WIN_COMBINATIONS[combination].each do |element| 
        return (element + 1) if board.cells[element]== " "
      end
    end 

    if critical_defeats.any?
      combination = critical_defeats.sample
      WIN_COMBINATIONS[combination].each do |element| 
        return (element + 1) if board.cells[element]== " "
      end
    end 

    if potential_wins.any?
      combination = potential_wins.sample
      WIN_COMBINATIONS[combination].each do |element| 
        return (element + 1) if board.cells[element]== " "
      end
    end

    if potential_defeats.any?
      combination = potential_defeats.sample
      WIN_COMBINATIONS[combination].each do |element| 
        return (element + 1) if board.cells[element]== " "
      end
    end

    board.cells.each_with_index do |value, index| 
      @valid_moves << ("#{index + 1}".to_s) if value == " "
    end

    @valid_moves.sample
  end

  def get_potential_wins(board)
    self.token == "X" ? opponent_token = "O" : opponent_token = "X" 
    win_combinations = []
    WIN_COMBINATIONS.each_with_index do |combo, index|
      cells = board.get_cells(combo)
      next if cells.include?(opponent_token)
      win_combinations << index if cells.include?(self.token)
    end
    win_combinations
  end

  def get_potential_defeats(board)
    self.token == "X" ? opponent_token = "O" : opponent_token = "X" 
    defeat_combinations = []
    WIN_COMBINATIONS.each_with_index do |combo, index|
      cells = board.get_cells(combo)
      next if cells.include?(self.token)
      defeat_combinations << index if cells.include?(opponent_token)
    end
    defeat_combinations
  end

 def get_critical_combinations(token, potentials, board)
   critical_combinations = []
   potentials.each do |potential, index|
     cells = board.get_cells(WIN_COMBINATIONS[potential]) 
     critical_combinations << potential if cells.count(token) == 2 
   end
   critical_combinations
 end
end
