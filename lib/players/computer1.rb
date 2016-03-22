class Computer < Player
  attr_accessor :best_choice, :opponent, :valid, :my_doubles, :their_doubles, :open_opposites, :open_good_spots

  WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
    ]

  OPPOSITES = [
    [0,8],
    [1,7],
    [2,6],
    [3,5]
    ]

  GOOD_SPOTS = [0,2,4,6,8]

  def initialize(token)
    @token = token
    @opponent = switch(token)
    @valid = []
    @my_doubles = []
    @their_doubles = []
    @open_opposites = []
    @open_good_spots = []
  end 

  def switch(token)
    token == "X" ? "O" : "X"
  end
  
  def move(board)
    valid.clear
    my_doubles.clear
    their_doubles.clear
    open_opposites.clear
    open_good_spots.clear
    evaluate(board)
    (best_choice + 1).to_s
  end

  def evaluate(board)
    board.available_spaces.each {|space| valid << space}
    if valid.count >= 8
      @best_choice = first_moves(board)
    else
      @best_choice = strategize(board)
    end
  end

  def first_moves(board)
    if valid.count == 9
      0
    elsif !board.taken?(5)
      4
    else
      options = []
      board.available_spaces.each_with_index {|cell, index| options << index if GOOD_SPOTS.include?(cell)}
      options.sample
    end
  end

  def strategize(board)
    look_at_board(board)
    if !my_doubles.empty?
      complete_move(board, my_doubles[0])
    elsif !their_doubles.empty?
      complete_move(board, their_doubles[0])
    elsif !open_opposites.empty?
      complete_move(board, open_opposites[0])
    elsif !open_good_spots.empty?
      open_good_spots.sample
    else
      valid.sample
    end
  end

  def look_at_board(board)
    WIN_COMBINATIONS.each do |combo|
      if combo.count {|cell| board.position(cell+1) == self.token} == 2 && combo.count {|cell| board.position(cell+1) == " "} == 1
        my_doubles << combo
      elsif combo.count {|cell| board.position(cell+1) == opponent} == 2 && combo.count {|cell| board.position(cell+1) == " "} == 1
        their_doubles << combo
      end
    end
    OPPOSITES.each do |pair|
      if pair.count { |cell| board.position(cell+1) == opponent} == 1 && pair.count { |cell| board.position(cell+1) == " "} == 1
        open_opposites << pair
      end
    end
    GOOD_SPOTS.each { |cell| open_good_spots << cell if board.position(cell+1) == " " }
  end

  def complete_move(board, combo)
    combo.detect {|cell| board.position(cell+1) == " "}
  end
end