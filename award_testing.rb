class Award
  attr_accessor :expires_in, :quality
  attr_reader :name

  def initialize(name, expires_in, quality)
    @name = name
    @expires_in = expires_in
    @quality = quality
  end

  def update_quality(type)
    type.update_quality

    if @name != 'Blue Distinction Plus'
      update_expires_in
    end
  end

  class BlueFirst
    def update_quality
      if @quality < 49 && @expires_in <= 0
        @quality += 2
      elsif @quality < 50 
        @quality += 1
      end
    end
  end

  class BlueCompare 
    def update_quality
      case 
      when @expires_in <= 0
        @quality = 0
      when @expires_in < 6
        @quality += 3 if @quality < 48
      when @expires_in < 11
        @quality += 2 if @quality < 49
      else 
        @quality += 1 if @quality < 50
      end
    end
  end

  class BlueDistinctionPlus
    def update_quality
      @quality = @quality
    end
  end

  class BlueStar
    def update_quality
      if @quality > 0
        @expires_in <= 0 ? @quality -= 4 : @quality -= 2
      end
    end
  end

  class NormalAward
    def update_quality
      if @quality > 0
        @expires_in <= 0 ? @quality -= 2 : @quality -= 1
      end
    end
  end

  private

  def update_expires_in
    @expires_in -= 1
  end
end