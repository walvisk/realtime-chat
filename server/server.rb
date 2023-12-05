require "socket"

def handle_client(client, clients)
  username = client.gets.chomp
  broadcast_all(clients, client, "#{username} has joined the chat")

  while incoming = client.gets
    chat = incoming.chomp
    broadcast_all(clients, client, chat)
  end

  client.close
  clients.delete(client)
  broadcast_all(clients, client, "#{username} has left the chat")
end

def broadcast_all(clients, client, msg)
  clients.each { |cl| cl.puts(msg) if cl != client}
end

server = TCPServer.new("localhost", 7007)
puts "Server Establihsed at port 7007"

clients = []
loop do
  client = server.accept
  clients << client

  Thread.new{ handle_client(client, clients) }
end
