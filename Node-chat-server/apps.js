/* 모듈 불러오기 */
const express = require('express');
const socket = require('socket.io');
const http = require('http');
const fs = require('fs');

/* express 객체 생성 */
const app = express();

/* express http 서버 생성 */
const server = http.createServer(app);

/* 생성된 서버를 socket.io에 바인딩 */
const io = socket(server);

app.use('/css', express.static('./static/css'));
app.use('/js', express.static('./static/js'));

/* Get 방식으로 / 경로에 접속하면 실행 됨 */
app.get('/', function(request, response) {
  fs.readFile('./static/chatting3.html', function(err, data) {
    if(err) {
      response.send('에러');
    } else {
      response.writeHead(200, {'Content-Type':'text/html'});
      response.write(data);
      response.end();
    }
  });
});


io.sockets.on('connection', function(socket) {
    // console.log('유저 접속 됨');

    /* 새로운 유저가 접속했을 경우 다른 소켓에게도 알려줌 */
    socket.on('join', function(data) {
        var name = socket.name = data.name;
        var room_num = socket.room_num = data.room_num;

        console.log('['+room_num+'] '+ name + ' 님이 접속하였습니다.');
      
        socket.join(room_num);
  
        /* 그 방의 소켓에게 전송 */
        //io.sockets.in(room_num).emit('update', {type: 'join', name: 'SERVER', message:'['+room_num+'] '+ name + '님이 접속하였습니다.'});
        io.sockets.in(room_num).emit('update', {type: 'join', name: 'SERVER', message: '(ू•ᴗ•ू❁) ' + name + '님이 접속하였습니다.'});
        
    });

    /* 전송한 메시지 받기 */
    socket.on('message', function(data) {
        /* 받은 데이터에 누가 보냈는지 이름을 추가 */
        data.name = socket.name;
        
        console.log(data);

        /* 보낸 사람을 제외한 나머지 유저에게 메시지 전송 */
        socket.broadcast.to(socket.room_num).emit('update', data);
    });

    /* 접속 종료 */
    socket.on('disconnect', function() {
        console.log('['+socket.room_num+'] '+ socket.name + '님이 나가셨습니다.. _(:3」∠)_');
        socket.leave(socket.room_num);

        /* 나가는 사람을 제외한 나머지 유저에게 메시지 전송 */
        socket.broadcast.to(socket.room_num).emit('update', {type: 'disconnect', name: 'SERVER', message: socket.name + '님이 나가셨습니다.'});
    });
    
});

/* 서버를 3000 포트로 listen */
server.listen(3000, function() {
  console.log('서버 실행 중..');
});