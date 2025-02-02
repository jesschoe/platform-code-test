class Award
  attr_accessor :expires_in, :quality
  attr_reader :name

  def initialize(name, expires_in, quality)
    @name = name
    @expires_in = expires_in
    @quality = quality
  end

  def update_quality
    case @name
    when 'Blue First'
      update_blue_first
    when 'Blue Compare'
      update_blue_compare
    when 'Blue Star'
      update_blue_star
    when 'Blue Distinction Plus'
      update_blue_distinction_plus
    else 
      update_normal_award
    end

    if @name != 'Blue Distinction Plus'
      update_expires_in
    end
  end

  def update_blue_first
    if @quality < 49 && @expires_in <= 0
      increase_quality(2)
    elsif @quality < 50 
      increase_quality()
    end
  end

  def update_blue_compare 
    case 
    when @expires_in <= 0
      @quality = 0
    when @expires_in < 6
      increase_quality(3) if @quality < 48
    when @expires_in < 11
      increase_quality(2) if @quality < 49
    else 
      increase_quality() if @quality < 50
    end
  end

  def update_blue_distinction_plus
    @quality = @quality
  end

  def update_blue_star
    if @quality > 0
      @expires_in <= 0 ? decrease_quality(4) : decrease_quality(2)
    end
  end

  def update_normal_award
    if @quality > 0
      @expires_in <= 0 ? decrease_quality(2) : decrease_quality()
    end
  end

  def update_expires_in
    @expires_in -= 1
  end

  private

  def increase_quality(value = 1)
    @quality += value
  end

  def decrease_quality(value = 1)
    @quality -= value
  end

end
