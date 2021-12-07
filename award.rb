class Award
  attr_accessor :expires_in, :quality
  attr_reader :name

  def initialize(name, expires_in, quality)
    @name = name
    @expires_in = expires_in
    @quality = quality
  end

  def blue_first
    if @quality < 49 && @expires_in <= 0
        @quality += 2
    elsif @quality < 50 
        @quality += 1
    end
  end

  def blue_compare
    if @quality < 50
      if @expires_in < 0
        @quality = 0
      elsif @expires_in < 6
        @quality += 3
      elsif @expires_in < 11
        @quality += 2
      else
        @quality += 1
      end
    end
  end

  def blue_star
    if @quality > 0
      if @expires_in < 0
        @quality -= 4
      else
        @quality -= 2
      end
    end
  end

  def blue_distinction_plus
    @quality = 80
  end

  def normal_award
    if @quality > 0
      if @expires_in <= 0
        @quality -= 2
      else
        @quality -= 1
      end
    end
  end
end
