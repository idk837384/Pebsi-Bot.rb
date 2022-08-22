require "socket"

def keepalive()
  t = Thread.new() {
    server = TCPServer.new 2000
    loop do
      puts "Server Alive"
      client = server.accept
      client.puts "I'm alive"
      client.close
    end
  }
end