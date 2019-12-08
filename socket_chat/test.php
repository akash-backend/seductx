test.php
const express = require('express'),
http = require('http'),
app = express(),
server = http.createServer(app),
io = require('socket.io').listen(server);

var clients = [];
app.get('/', (req, res) => {
res.send('Chat Server is running on port 3000')
});





io.on('connection', (socket) => {

console.log('user connected')

socket.on('join', function(userNickname) {

  clients.push(userNickname); 
  console.log(clients);
  console.log(userNickname +" : has joined the chat "  );

 socket.broadcast.emit('userjoinedthechat',userNickname +" : has   joined the chat ", clients);
    })


socket.on('messagedetection', (senderNickname,messageContent) => {
       
       //log the message in console 

       console.log(senderNickname+" : " +messageContent)
       console.log(clients);
       
      //create a message object 
      
      let  message = {"message":messageContent, 
                      "senderNickname":senderNickname}
        
// send the message to all users including the sender  using io.emit  
       
      io.emit('message', message,clients)
     
      })

     socket.on('disconnect', function(userNickname) {

        console.log(userNickname +' has left ');
        // clients.splice(clients.indexOf(userNickname), 1);
        // console.log(clients);
        socket.broadcast.emit( "userdisconnect" ,userNickname+" has left")

        
      

    })




})

 




server.listen(3000,()=>{

console.log('Node app is running on port 3000')

})