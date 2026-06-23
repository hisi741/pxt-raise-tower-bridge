pins.spiFormat(8, 3)
pins.spiFrequency(2500000)
pins.spiPins(DigitalPin.P0, DigitalPin.P0, DigitalPin.P0)

function sendWS2812Byte(char: number){
    let bytestream = 0
    for (let i = 0; i < 8; i++) {
        let bitsToAdd = 0b000
        if (char >> i & 0b1){
            bitsToAdd = 0b110 //logical 1
        }else{
            bitsToAdd = 0b100 //logical 0
        }

        bytestream = (bytestream << 3) | bitsToAdd
    }

    pins.spiWrite(bytestream >> 16 & 0xFF)
    pins.spiWrite(bytestream >> 8 & 0xFF)
    pins.spiWrite(bytestream >> 0 & 0xFF)

}

basic.forever(function () {

    for (let i = 0; i < 8; i++) { //for each LED in the sequence

    }

    serial.writeLine("" + sendWS2812Byte(0b11001100))

    basic.pause(100)

})
