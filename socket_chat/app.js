var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);
var request = require('request');

var clients =[];

// sender will send latitude and longitude
app.get('/',function(req,res){
    res.send("Welcome to my socket");
});

 io.on('connection', function(socket) {
	 
   console.log('A user connected'+socket.id);
  
   
    socket.on('IamOnline', function(data) {
      console.log('user connected');
      console.log(data);
       request.post('https://www.seductx.com/seductxApi/escort/updateProfile', {form:{'escort_id':data.userId,'online_status':1}});
       var clientInfo = new Object();
            clientInfo.customId      = data.userId;
            clientInfo.clientId     = socket.id;
            clients.push(clientInfo);
			 io.sockets.emit('UserOnline', data);
   });


     socket.on('IamOffline', function(data) {
      console.log('disconnect');
      for( var i=0, len=clients.length; i<len; ++i ) {
                var c = clients[i];
                if(c.clientId == socket.id) {
                  io.sockets.emit('UserOffline', c.customId);
                  console.log(c.customId);
                  request.post('https://www.seductx.com/seductxApi/escort/updateProfile', {form:{'escort_id':c.customId,'online_status':2}});
                  clients.splice(i,1);
                  break;
                }
            }
   });
   /////////////////////////////
   
   
    socket.on('disconnect', function (data) {
      console.log('disconnect');
            for( var i=0, len=clients.length; i<len; ++i ) {
                var c = clients[i];
                if(c.clientId == socket.id) {
   					      io.sockets.emit('UserOffline', c.customId);
                  console.log(c.customId);
                  request.post('https://www.seductx.com/seductxApi/escort/updateProfile', {form:{'escort_id':c.customId,'online_status':2}});
					        clients.splice(i,1);
                  break;
                }
            }

        });
   
   
   
   /////////////////////////////
   

    socket.on('message',function(data){
      console.log(data);
      request.post('https://www.seductx.com/seductxApi/chat/chatAdd', {form:{'userFrom':data.userFrom,'userTo':data.userTo,'message':data.message,'sendForm':data.sendForm}});
      io.sockets.emit('new message'+ data.type + data.userTo, {userFrom:data.userFrom,userTo:data.userTo,message:data.message,sendForm:data.sendForm});
    })
  });
  
    
  http.listen(process.env.PORT || 5000, function(){
    console.log('listening on', http.address().port);
  });