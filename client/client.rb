require "socket"
class Client
  def initialize(port = 7007)
    @client  = TCPSocket.new("localhost", port)
    @threads = []
  end

  def run!
    loop do
      print("send: ")
      mssg = gets.chomp
      break if mssg == "quit"
      @client.puts mssg

      incoming = @client.gets.chomp
      puts "recv: #{incoming}"
    end

    @client.close
  end
end

Client.new.run!
