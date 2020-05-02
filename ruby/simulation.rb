#!/usr/bin/ruby

require './robot'

robot = Robot.new
puts 'running simulation, type exit to quit'

loop do
  input = gets.chomp.downcase.split(' ')
  command, args = input[0], input[1]&.split(',') || []

  case command
  when 'place'
    robot.place(*args) if args.length == 3
  when 'move'
    robot.move
  when 'left', 'right'
    robot.rotate(command)
  when 'report'
    puts robot.report
  when 'exit'
    break puts robot.report
  end
end
