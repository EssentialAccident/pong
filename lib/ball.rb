# frozen_string_literal: true

# This class controls the logic and graphics
# for the ball
class Ball < Circle
  # Initiliaze method
  # Parameters
  # center - Vector2d - Position of the center of the ball
  # speed - integer - It will determine the speed of the ball
  def initialize(center, speed = 10, size = 10)
    @center = center
    super({ x: @center.x,
            y: @center.y,
            radius: size,
            color: COLOR })

    @velocity = Vector2d(rand + speed, rand + speed)
  end
end
