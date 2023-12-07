require "socket"
class Client
  def initialize(port = 7007)
    @client  = TCPSocket.new("localhost", port)
    @threads = []
  end

  def run!
    print("name: ")
    name = gets.chomp
    @client.puts name

    Thread.new do
      loop do
        message = @client.gets.chomp
        puts message
      end
    end

    loop do
      incoming = gets.chomp
      @client.puts incoming
    end

    @client.close
  end
end

Client.new.run!
