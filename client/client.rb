require "socket"
class Client
  def initialize(port = 7007)
    @client  = TCPSocket.new("localhost", port)
    @threads = []
  end

  def run!
    setup
    @threads.each(&:join)
    @client.close
  end

  def setup
    @client.puts("Client #{rand(1..10)}")

    reading = Thread.new do
      while incoming = @client.gets
        chat = incoming.chomp
        puts chat
      end
    end
    @threads << reading

    writing = Thread.new do
      print("(me) > ")
      while sent = gets
        chat = sent.chomp
        @client.puts(chat)
      end
    end
    @threads << writing
  end
end

Client.new.run!
