require "socket"

class Server
  def initialize(port = 7007)
    @server  = TCPServer.new("localhost", port)
    @clients = []
  end

  def run!
    loop do
      client = @server.accept
      @clients << client

      Thread.new{ handle_client(client, @clients) }
    end
  end

  def handle_client(client, clients)
    while incoming = client.gets
      chat = incoming.chomp
      broadcast_all(clients, client, chat)
    end

    client.close
    clients.delete(client)
  end

  def broadcast_all(clients, client, msg)
    clients.each { |cl| cl.puts(msg) }
  end
end

Server.new.run!
