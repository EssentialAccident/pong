# frozen_string_literal: true

# This class controls the logic and graphics
# for the player

DIST_BORDER = 15
THICKNESS = 15

class Player < Rectangle
  # Initialize method
  # Parameters
  # Side - symbol - which side is the player in :left or :right
  # Size - integer - The size (height) of the paddle
  # Speed - integer - The speed in pixels that the paddle would move
  def initialize(side, size = 200, speed = 5)
    @side = side
    @size = size
    @speed = Vector2d(0, speed)
    case @side
    when :left
      @center = Vector2d.new(DIST_BORDER + (THICKNESS / 2), (WINDOW_HEIGHT / 2))
    when :right
      @center = Vector2d.new(WINDOW_WIDTH - DIST_BORDER - (THICKNESS / 2), (WINDOW_HEIGHT / 2))
    end
    super(
      {
        x: @center.x - (THICKNESS / 2),
        y: @center.y - (@size / 2),
        width: THICKNESS,
        height: @size,
        color: COLOR
      }
    )
  end

  # Moves the player's paddle up
  def move_up
    @center -= @speed
    update_graphics
  end

  # Moves the player's paddle down
  def move_down
    @center += @speed
    update_graphics
  end

  private

  # Updates the grapics after movement have been done
  def update_graphics
    self.y = @center.y - (@size / 2)

    # Check collision with upper wall
    if @y < 0
      self.y = 0
      @center = Vector2d.new(@center.x, @y + (@size / 2))
    end

    # Check collision with lower wall
    if @y + @size > WINDOW_HEIGHT
      self.y = WINDOW_HEIGHT - @size
      @center = Vector2d.new(@center.x, @y + (@size / 2))
    end
  end
end
