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

const socket_chat = io.of('/chat');
const socket_room = io.of('/room');
const socket_rooming = io.of('/rooming');

socket_chat.on('connection', function(socket) {
    // console.log('유저 접속 됨');

    /* 새로운 유저가 접속했을 경우 다른 소켓에게도 알려줌 */
    socket.on('join', function(data) {
        var name = socket.name = data.name;
        var room_num = socket.room_num = data.room_num;

        console.log('['+room_num+'] '+ name + ' 님이 접속하였습니다.');
      
        socket.join(room_num);
  
        /* 그 방의 소켓에게 전송 */
        //io.sockets.in(room_num).emit('update', {type: 'join', name: 'SERVER', message:'['+room_num+'] '+ name + '님이 접속하였습니다.'});
        socket_chat.in(room_num).emit('update', {type: 'join', name: 'SERVER', message: '(ू•ᴗ•ू❁) ' + name + '님이 접속하였습니다.'});
        
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
        socket.broadcast.to(socket.room_num).emit('update', {type: 'disconnect', name: 'SERVER', message: socket.name + '님이 나가셨습니다. _(:3」∠)_'});
    });
    
});


socket_room.on('connection', function(socket) {

  console.log('room 입장');
  /* 새로운 유저가 접속했을 경우 다른 소켓에게도 알려줌 */
  socket.on('join', function(data) {
      var name = socket.name = data.name;
      var room_num = socket.room_num = data.room_num;
      var latitude = socket.latitude = data.latitude;
      var longitude = socket.longitude = data.longitude;

      console.log('['+room_num+'] '+ name + ' 님이 접속하였습니다. (위치: lat_'+latitude+', lon_'+longitude+')');
    
      socket.join(room_num);

      /* 그 방의 소켓에게 전송 */
      //io.sockets.in(room_num).emit('update', {type: 'join', name: 'SERVER', message:'['+room_num+'] '+ name + '님이 접속하였습니다.'});
      socket_room.in(room_num).emit('update', {type: 'join', name: 'SERVER', message: '(ू•ᴗ•ू❁) ' + name + '님이 방에 들어오셨습니다.', latitude: latitude, longitude: longitude});
      
  });

  /* 준비상태 변경하면 업뎃 */
  socket.on('ready', function(data) {

      console.log('['+socket.room_num+']'+data.u_idx+'번 회원이 준비 누름');

      /* 유저에게 전송 */
      socket_room.in(socket.room_num).emit('ready_up', data);
  });

  /* 시작하면 업뎃 */


  /* 접속 종료 */
  socket.on('disconnect', function() {
      console.log('['+socket.room_num+'] '+ socket.name + '님이 나가셨습니다.. _(:3」∠)_');
      socket.leave(socket.room_num);

      /* 나가는 사람을 제외한 나머지 유저에게 메시지 전송 */
      socket.broadcast.to(socket.room_num).emit('update', {type: 'disconnect', name: 'SERVER', message: socket.name + '님이 나가셨습니다. _(:3」∠)_'});
  });
  
});


socket_rooming.on('connection', function(socket) {

  console.log('room 입장');
  /* 새로운 유저가 접속했을 경우 다른 소켓에게도 알려줌 */
  socket.on('join', function(data) {
      var name = socket.name = data.name;
      var room_num = socket.room_num = data.room_num;
      var latitude = socket.latitude = data.latitude;
      var longitude = socket.longitude = data.longitude;

      console.log('['+room_num+'] '+ name + ' 님이 접속하였습니다. (위치: lat_'+latitude+', lon_'+longitude+')');
    
      socket.join(room_num);

      /* 그 방의 소켓에게 전송 */
      //io.sockets.in(room_num).emit('update', {type: 'join', name: 'SERVER', message:'['+room_num+'] '+ name + '님이 접속하였습니다.'});
      socket_rooming.in(room_num).emit('update', {type: 'join', name: 'SERVER', message: '(ू•ᴗ•ू❁) ' + name + '님이 방에 들어오셨습니다.', latitude: latitude, longitude: longitude});
      
  });

  /* 라이딩 종료 */
  socket.on('end', function(data) {

    console.log('['+socket.room_num+']'+data.u_idx+'번 회원이 라이딩을 종료하였습니다.');
    console.log(data.endmsg);

    /* 유저에게 전송 */
    socket_rooming.in(socket.room_num).emit('end_up', data);
    socket.broadcast.to(socket.room_num).emit('end_up_msg', {'endmsg':data.endmsg, 'does_success':data.does_success});
  });

  /* 모두 라이딩 종료 */
  

  /* 접속 종료 */
  socket.on('disconnect', function() {
      console.log('['+socket.room_num+'] '+ socket.name + '님이 나가셨습니다.. _(:3」∠)_');
      socket.leave(socket.room_num);

      /* 나가는 사람을 제외한 나머지 유저에게 메시지 전송 */
      socket.broadcast.to(socket.room_num).emit('update', {type: 'disconnect', name: 'SERVER', message: socket.name + '님이 나가셨습니다. _(:3」∠)_'});
  });
  
});


/* 서버를 3000 포트로 listen */
server.listen(3000, function() {
  console.log('서버 실행 중..');
});