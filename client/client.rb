require "socket"

conn = TCPSocket.new("localhost", 7007)
conn.puts("Client #{rand(1..10)}")
loop do
  mesg = conn.gets
  puts mesg
end
