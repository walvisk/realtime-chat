require "socket"


server = TCPServer.new(7007)
loop do
  client = server.accept
  username = client.gets.chomp

  client.puts("#{username} has joined the chat")
end
