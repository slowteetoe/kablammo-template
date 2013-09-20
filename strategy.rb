# Game Info
# 
# board -- the game board
#   See: https://github.com/carbonfive/kablammo-strategy/blob/master/lib/strategy/models/board.rb
# robot -- you
#   See: https://github.com/carbonfive/kablammo-strategy/blob/master/lib/strategy/models/robot.rb
# opponents -- opponent robots
#   See: https://github.com/carbonfive/kablammo-strategy/blob/master/lib/strategy/models/robot.rb
# 
# Actions:
# 
# fire!(skew=0) -- shot at something
# rotate!(degrees) -- rotate the turret
# rest -- rest and reload
# move_north! -- move north
# move_south! -- move south
# move_east! -- move east
# move_west! -- move west

require './hybrid-strategy'

on_turn do
  act
end
