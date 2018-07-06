var app = require('express')();
var http = require('http').Server(app);
var io = require('socket.io')(http);

app.get('/', function(req, res){
  res.sendFile(__dirname + '/index.html');
});

var arr3 = [ 
'Please speak English with me',
'OK, My pleasure',
'It\'s not difficult to speak English',
'You\'re right. It\'s pretty easy if you practice enough',
'Everything is ready',
'Great! Thanks for all your help',
'Practice makes perfect',
'I totally agree. I just need to more time to practice',
'My mother is a wonderful teacher',
'That\'s terrific. What does your father do?',
'He speaks perfect English',
'I know. I really envy him',
'Remember to call your mother',
'Thanks for reminding me. I almost forgot',
'America and VietNam should always work together',
'You\'re absolutely right',
'Sorry to bother you',
'You aren\'t bothering me. What can I do for you?',
'You have a charming smile',
'Really? I am flattered',
'Always say please and thank you',
'You should also say excuse me when you bump into someone. Good manners to important',
'It\'s important to practice English every day',
'That\'s true. Constant practice English is this only way to improve',
'You should word harder',
'Thanks for your advice. I\'ll work my best',
'What\'s your favorite food?',
'My favorite food is noodles',
'Don\'t be afraid of making mistake',
'Thanks for your encouragement. I just always worry about looking foolish',
'Is this your first time in VietNam',
'Yes, and I\'m having a wonderful time here',
'I really enjoyed talking to you. Bye',
'Same here. See you later',
'I hope to see you again',
'Me, too. It was so great to run into you',
'You\'re an outstanding teacher',
'Thank you very much. I appreciate the compliment',
'It\'s very important to have clear pronunciation',
'I think so, too. Pronunciation  is the key to smooth communication',
'We should all care about the environment',
'That\'s the truth! We really need to be serious about protecting the earth',
'I\'m sure you will enjoy it',
'I\'m sure I will, too. Thank you so much for your recommendation',
'Nothing is impossible',
'That\'s a wonderful attitude',
'Believe in yourself',
'I try but sometimes it is difficult. I lose confidence in myself to easily',
'Don\'t waste time',
'I\'m working as fast as I can. Please be patient',
'Let me know what you decide',
'OK. I will give you a call when I make up my mind',
'Keep up the good work',
'I\'ll try my best',
'Let me help you',
'That\'s OK. I can manage',
'Our government does a good job',
'I\'m glad you feel that way',
'I feel a little sick today',
'Really? What seems to be the problem?',
'When are you leaving?',
'Tomorrow afternoon. My flight is at two',
'Don\'t be nervous. Relax',
'Sometimes I can\'t help it',
'Do you do a lot of business in Vietnam?',
'Yes. Our company is expanding all over VietNam',
'This is a special local dish',
'It\'s a pleasure to be here today',
'We are honored to have you with us',
'I need to use the bathroom',
'No problem. It\'s right down the hall',
'Are you used to the weather here?',
'Not really. My hometown is much warmer than it is here',
'You look terrific today',
'Thanks! I just bought these cothers yesterday.',
'Vietnam is changing every day',
'I know. Vietnam is really an exciting place to be right now',
'English is an international language',
'That\'s why I am so eager to learn English well',
'I have a poor memory',
'So do I, but I try to do mental exercises to improve it',
'Can you give me your telephone number?',
'Sure. What\'s your number? I\'ll call your phone anh then you will have it'
];
console.log(arr3.length);
function getRandomInt(max) {
    return Math.floor(Math.random() * Math.floor(max));
  }  
var x=0;
io.on('connection', function(socket){
    socket.on('chat message', function(msg){
        //io.emit('chat message', 'Hello, nhập 1 để bắt đầu.');
        if(msg=='1')
        {
            x=getRandomInt(82);
            io.emit('chat message', 'Nhập câu tương ứng: '+arr3[x]);
        }
        else if(msg=='2')
        {
            var y=0;
            if(x%2 == 0)
                y=x+1;
            else
                y=x-1;
            io.emit('chat message','Đáp án: '+arr3[y]);
        }
        else
            {
                var y=0;
                if(x%2 == 0)
                    y=x+1;
                else
                    y=x-1;
                if(msg.toLowerCase()==arr3[y].toLowerCase())
                {
                    io.emit('chat message', 'Chính xác:');
                    if(x%2 == 0)
                    {
                        io.emit('chat message', arr3[x]);
                        io.emit('chat message', arr3[y]);
                    }
                    else
                    {
                        io.emit('chat message', arr3[y]);
                        io.emit('chat message', arr3[x]);
                    }
                    io.emit('chat message', 'Gõ 1 để tiếp tục:')
                }
                else
                {
                    io.emit('chat message', 'Sai rồi, xin mời nhập lại.----->'+ msg);
                    io.emit('chat message', 'Hoặc chịu nhục thì nhấn 2 để xem đáp án.');
                }
            }
    });
  });
      

http.listen(3000, function(){
  console.log('listening on *:3000');
});
    