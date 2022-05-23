# frozen_string_literal: true

# This class controls the logic and graphics
# for the ball
class Ball < Circle
  # Initiliaze method
  # Parameters
  # center - Vector2d - Position of the center of the ball
  # speed - integer - It will determine the speed of the ball
  def initialize(center, speed = 2, size = 10)
    @center = center
    super({ x: @center.x,
            y: @center.y,
            radius: size,
            color: COLOR })

    # The balls initial velocity is calculated based on angle
    # The ball will move towards that angle at the balls determined speed
    angle = rand(360) * (Math::PI / 180)
    @velocity = Vector2d(Math.cos(angle) * speed, Math.sin(angle) * speed)
  end

  def update
    self.center = @center + @velocity
  end

  def center=(vector)
    @center = vector
    @x = @center.x
    @y = @center.y
  end
end
