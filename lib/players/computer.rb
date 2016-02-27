class Computer < Player

  def initialize(token, level = 3)
    @token = token
    #@opponents_token is to simplify the 'hard' strategy
    if @token=="X"
      @opponents_token="O"
    else @token=="O"
      @opponents_token="X"
    end
    @level = level
    @wc = Game.new.class::WIN_COMBINATIONS
    #level is set to 3, 'true' leads to a user's choice
    if @level == true
      puts "Choose difficulty level:"
      puts "1. Normal"
      puts "2. Hard"
      #puts "3. Impossible"
      input = gets.strip.to_i
      if input.is_a?(Integer) && input.between?(1,3)
        @level = input
      else
        puts "Didn't quite catch that.  Impossible it is."
        @level = 3
      end
    end
  end

  def move(token, board=nil)
    #depending on the @level, call appropriate function
    case @level
    when 1
      normal
    when 2
      hard(board)
    when 3
      impossible
    else
      puts "ERROR! NEED INPUT STEPHANIE!"
      return
    end
  end

  def normal
    return rand(1..9).to_s
  end

  def hard(board)
    #go through each win combination looking for a win
    @wc.each do |triplet|
      #if there are 2 "good-guy" marks and an empty space: WIN, man, WIN!
      if triplet.count{|s| board.cells[s]==@token }==2 && triplet.none?{|s| board.cells[s]==@opponents_token }
        #puts "we're in it to win it!"
        #this will return a 1-element array
        hotspot = triplet.select{|s| board.cells[s]==" "}
        return hotspot.first + 1
      #if there are 2 "bad-guy" marks and an empty space: BLOCK, man, BLOCK!
      end
    end
    #go through each win combination looking for a block
    @wc.each do |triplet|
      if triplet.count{|s| board.cells[s]==@opponents_token }==2 && triplet.none?{|s| board.cells[s]==@token }
        #puts "we're in to block!"
        #this will return a 1-element array
        hotspot = triplet.select{|s| board.cells[s]==" "}
        return hotspot.first + 1
      end
    end
    return normal
  end

  def impossible
    return rand(1..9).to_s
  end

end
