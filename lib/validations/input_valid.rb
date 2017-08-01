class InputValid

  def invalid
      puts "You have choosen an invalid selction."
  end

  def empty?(string)
    string.empty?
  end

  def in_range?(number)
    (0..2).include?(number)
  end

  def digits?(string)
    string.scan(/^[\d]+$/).any?
  end

  def letters?(string)
    string.scan(/^[a-zA-Z]+$/).any?
  end

  def yes_no?(string)
    string.scan(/^[\A[y]|^yes$|[n]o\Z]+$/).any?
  end
end
