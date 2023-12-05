require "socket"

client = TCPSocket.new("localhost", 7007)
client.puts("Client #{rand(1..10)}")

threads = []
reading = Thread.new do
  while incoming = client.gets
    chat = incoming.chomp
    puts chat
  end
end
threads << reading

writing = Thread.new do
  while sent = gets
    chat = sent.chomp
    client.puts(chat)
  end
end
threads << writing

threads.each(&:join)

client.close
