#################################
## Recreation of the PONG game ##
## Coded by Lino Oropeza       ##
## Started 05/23/2022          ##
#################################

# frozen_string_literal: true\

# Gems
require 'ruby2d'
require 'vector2d'

# Internal requirements
require_relative 'lib/ball'
require_relative 'lib/player'

# Constants
WINDOW_WIDTH = 1024
WINDOW_HEIGHT = 800
COLOR = 'white'

# Basic setup
set width: WINDOW_WIDTH, height: WINDOW_HEIGHT

# Ball
# Creates the ball in the middle of the screen
ball = Ball.new(Vector2d.new(WINDOW_WIDTH / 2, WINDOW_HEIGHT / 2))
left_player = Player.new(:left)
right_player = Player.new(:right)

# Keyboard input
on :key do |event|
  case event.key
  # Player movement
  when 'up'
    right_player.move_up
  when 'down'
    right_player.move_down
  when 'w'
    left_player.move_up
  when 's'
    left_player.move_down

  # Closing the game
  when 'escape'
    close
  end
end

# Update loop
update do
  ball.update
end
show
