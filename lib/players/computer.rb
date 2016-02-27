class Computer < Player

  def initialize(token, level = 3)
    @token = token
    @level = level
    @wc = Game.new.class::WIN_COMBINATIONS
    #level is set to 3, 'true' leads to a user's choice
    if @level == true
      puts "Choose difficulty level:"
      puts "1. Normal"
      puts "2. Hard"
      puts "3. Impossible"
      input = gets.strip.to_i
      if input.is_a?(Integer) && input.between?(1,3)
        @level = input
      else
        puts "Didn't quite catch that.  Impossible it is"
        @level = 3
      end
    end
  end

  def move(token)
    case @level
    when 1
      normal
    when 2
      hard
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

  def hard
    return rand(1..9).to_s
  end

  def impossible
    return rand(1..9).to_s
  end

end
