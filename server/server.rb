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

      name = client.gets.chomp
      client.puts("Welcome to the chatroom!")

      Thread.new { handle_client(name, client) }
    end

    client.close
  end

  def handle_client(name, client)
    while mssg = client.gets.chomp
      broadcast_all(@clients, client, "#{name}: #{mssg}")
    end
    client.close
    @clients.delete(client)
  end

  def broadcast_all(clients, client, msg)
    clients.each { |cl| cl.puts(msg) if cl != client}
  end
end

Server.new.run!
