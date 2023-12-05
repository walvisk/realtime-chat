require "socket"


server = TCPServer.new("localhost", 7007)
puts "Server Establihsed at port 7007"
loop do
  client = server.accept
  if client
    puts "A Client has been connected"
  end
  username = client.gets.chomp

  client.puts("#{username} has joined the chat")
end
