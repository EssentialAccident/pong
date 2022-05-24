# frozen_string_literal: true

# This class controls the logic and graphics
# for the player

DIST_BORDER = 15
THICKNESS = 15

class Player < Rectangle
  # Initialize method
  # Parameters
  # Side - which side is the player in :left or :right
  def initialize(side, size = 200)
    @side = side
    @size = size
    case @side
    when :left
      @center = Vector2d.new(DIST_BORDER + (THICKNESS / 2), (WINDOW_HEIGHT / 2) - (@size / 2))
    when :right
      @center = Vector2d.new(WINDOW_WIDTH - DIST_BORDER - (THICKNESS / 2), (WINDOW_HEIGHT / 2) - (@size / 2))
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
end
