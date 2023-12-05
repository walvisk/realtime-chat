## Overview
chit-chat is a simple ruby chat server on cli

## How to Run
1. go to server dir, and run `ruby server.rb`
2. open new command line tab
3. go to client dir, and run `ruby client.rb`


## TODO
- [x] If a client connect to server, all client except it need to be notified that it joined the chat, not only one client
- [x] a client can send message to server and broadcast to all client. For now it only connect to server
- [x] explore using Thread
- [ ] explore using redis