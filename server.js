const net = require("net")

let totalTransmitted = 0;
const startTime = time();

function time() {
    return new Date(new Date().getTime()).toLocaleTimeString();
}

function measureDataRate(totalTransmission, time) {
    let timeTaken = time - startTime;
    return timeTaken;
};

const server = net.createServer(socket => {
    socket.on("data", function (data) {
        let dataLength = data.toString().length;
        totalTransmitted += dataLength;
        console.log("Packet Recieved: {Size: " + data.toString().length + 'bits, Cumulative transmission: ' + totalTransmitted 
        + 'bits, Time: ' + time() + ' Data rate:' + measureDataRate(totalTransmitted, time()) + '}');
    })
})

server.listen(8080, function () {
    console.log('TCP server running @ 127.0.0.1:8080');
})
