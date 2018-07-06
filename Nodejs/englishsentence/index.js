var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

var arr3 = [ 'Con meo', 'meo meo', 
'Con cho' ,'gau gau',
'Con ga' ,'Cuc tac',
'Con vit' ,'Quac quac',
'Con lon' ,'Un in'
];
console.log(arr3.length);
function getRandomInt(max) {
    return Math.floor(Math.random() * Math.floor(max));
  }  
var x=0;
io.on('connection', function(socket){
    socket.on('chat message', function(msg){
        
        if(msg=='1')
        {
            x=getRandomInt(9);
            io.emit('chat message', arr3[x]);
        }
        else
            {
                var y=0;
                if(x%2 == 0)
                    y=x+1;
                else
                    y=x-1;
                console.log(msg);                  
                console.log(arr3[y]);    
                if(msg==arr3[y])
                {
                    io.emit('chat message', 'Dung roi: '+ arr3[y])
                }
                else
                {
                    io.emit('chat message', 'Sai roi, xin moi viet lai');
                }
            }
    });
  });
      

http.listen(3000, function(){
  console.log('listening on *:3000');
});
    