# frozen_string_literal: true

require 'pty'
require 'socket'
startup_file = 'config/tidal_init.ghci'
begin
  PTY.spawn("ghci -ghci-script #{startup_file}") do |stdout, stdin, pid|
    server = TCPServer.open(2000)
    loop{
      client_connection = server.accept
      stdin.puts client_connection.gets
      client_connection.close
    }
  end
rescue SystemExit, Interrupt
  puts '- Stopping TidalCycles...'
  puts 'Exiting'
end
