# frozen_string_literal: true

# This class controls the logic and graphics
# for the ball
class Ball < Circle
  # Initiliaze method
  # Parameters
  # center - Vector2d - Position of the center of the ball
  # speed - integer - It will determine the speed of the ball
  # size - integer - Size (radius) of the ball
  def initialize(center, speed = 2, size = 10)
    @center = center
    super({ x: @center.x,
            y: @center.y,
            radius: size,
            color: COLOR })

    # The balls initial velocity is calculated based on angle
    # The ball will move towards that angle at the balls determined speed
    angle = initial_angle * (Math::PI / 180)
    @velocity = Vector2d(Math.cos(angle) * speed, Math.sin(angle) * speed)
  end

  # It keeps moving the ball
  def update
    self.center = @center + @velocity
    check_walls
  end

  # Updates the center and the position of the ball
  def center=(vector)
    @center = vector
    @x = @center.x
    @y = @center.y
  end

  private

  # Check collision of the ball with the upper and lower balls
  def check_walls
    top_border = @center.y - @radius
    bottom_border = @center.y + @radius
    @velocity = Vector2d.new(@velocity.x, @velocity.y * -1) if top_border < 0 || bottom_border > WINDOW_HEIGHT
  end

  # Calculates the angle in which the ball starts
  def initial_angle
    side = %i[left right]
    case side.sample
    when :left
      rand(135...225)
    when :right
      rand(-45...45)
    end
  end
end
