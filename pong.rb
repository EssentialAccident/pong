#################################
## Recreation of the PONG game ##
## Coded by Lino Oropeza       ##
## Started 05/23/2022          ##
#################################

# frozen_string_literal: true

# Libraries
require 'ruby2d'

# Internal requirements

# Basic setup
set width: 1024, height: 800

# Keyboard input
on :key do |event|
  case event.key
  when 'escape'
    close
  end
end
show
