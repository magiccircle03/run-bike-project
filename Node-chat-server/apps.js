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

io.sockets.on('connection', function(socket) {
    // console.log('유저 접속 됨');

    /* 새로운 유저가 접속했을 경우 다른 소켓에게도 알려줌 */
    socket.on('newUser', function(name) {
        console.log(name + ' 님이 접속하였습니다.');

        /* 소켓에 이름 저장해두기 */
        socket.name = name;

        /* 모든 소켓에게 전송 */
        io.sockets.emit('update', {type: 'connect', name: 'SERVER', message: '(ू•ᴗ•ू❁) '+name + '님이 접속하였습니다!!'});
    });

    /* 전송한 메시지 받기 */
    socket.on('message', function(data) {
        /* 받은 데이터에 누가 보냈는지 이름을 추가 */
        data.name = socket.name;
        
        console.log(data);

        /* 보낸 사람을 제외한 나머지 유저에게 메시지 전송 */
        socket.broadcast.emit('update', data);
    });

    /* 접속 종료 */
    socket.on('disconnect', function() {
        console.log(socket.name + '님이 나가셨습니다.');

        /* 나가는 사람을 제외한 나머지 유저에게 메시지 전송 */
        socket.broadcast.emit('update', {type: 'disconnect', name: 'SERVER', message: socket.name + '님이 나가셨습니다.. _(:3」∠)_'});
    });
    
});

/* 서버를 3000 포트로 listen */
server.listen(3000, function() {
  console.log('서버 실행 중..');
});