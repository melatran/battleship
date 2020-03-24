class Ship
  attr_reader :name,
              :length,
              :health

  def initialize(name, length)
    @name = name
    @length = length
    @health = health
  end

  def health
    health = @length
  end

  def hit
    @length -= 1
  end

  def sunk?
    if health == 0
      true
    else
      false
    end
  end
end
