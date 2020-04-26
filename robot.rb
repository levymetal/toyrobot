class Robot
  VALID_X, VALID_Y = 0..4, 0..4
  VALID_F = %w(north east south west)

  def initialize
    @x, @y, @f = 0, 0, nil
  end

  def place(x, y, f)
    x, y = x.to_i, y.to_i
    @x, @y, @f = x, y, f if VALID_X.include?(x) && VALID_Y.include?(y) && VALID_F.include?(f)
  end

  def move
    return unless @f

    next_x = case @f
    when 'east' then @x + 1
    when 'west' then @x - 1
    end

    next_y = case @f
    when 'north' then @y + 1
    when 'south' then @y - 1
    end

    @x = next_x if VALID_X.include?(next_x)
    @y = next_y if VALID_Y.include?(next_y)
  end

  def rotate(direction)
    return unless current_index = VALID_F.index(@f)

    case direction
    when 'left'
      @f = VALID_F.fetch(current_index - 1)
    when 'right'
      @f = VALID_F.fetch(current_index + 1, VALID_F.first)
    end
  end

  def report
    "#{@x},#{@y},#{@f}"
  end
end
