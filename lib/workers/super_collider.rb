# frozen_string_literal: true

require 'pty'
super_collider = '/Applications/SuperCollider.app/Contents/MacOS/sclang'
startup_file = 'config/superdirt_startup.scd'

begin
  PTY.spawn("#{super_collider} #{startup_file}") do |stdout, stdin, pid|
    # stdout.each { |line| print line if line =~ /MIDI/ }
    stdout.each { |line| print line }
  end
rescue SystemExit, Interrupt
  puts '- Stopping SuperCollider...'
  puts 'Exiting'
end
