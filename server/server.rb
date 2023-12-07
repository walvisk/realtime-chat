require "socket"

class Server
  def initialize(port = 7007)
    @server  = TCPServer.new("localhost", port)
    @clients = []
  end

  def run!
    client = @server.accept
    name = client.gets.chomp
    loop do
      incoming = client.gets.chomp
      client.puts("#{name}: #{incoming}")
    end

    client.close
  end

  def broadcast_all(clients, msg)
    clients.each { |cl| cl.puts(msg) }
  end
end

Server.new.run!
