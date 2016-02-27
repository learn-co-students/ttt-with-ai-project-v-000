class Computer < Player

  def initialize(token, level = 1)
    @token = token
    @level = level
    puts "level: #{@level}"
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
