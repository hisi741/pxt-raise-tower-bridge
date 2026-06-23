
ColorSensor.configureColorSensor()
// let strip = neopixel.create(DigitalPin.P15, 8, NeoPixelMode.RGB)

basic.forever(function () {
    // setEncoderChannel(1)
    basic.pause(100)

    let RGBvals = ColorSensor.getReadingRGB()
    let rawVals = ColorSensor.getChannelReadingsRaw()
    let CIExy = ColorSensor.getReadingCIExyChromaticity()
    let hueAngle = ColorSensor.getRawHueAngle()
    let satDist = ColorSensor.getRawSatDist()

    // strip.showColor(neopixel.hsl(hueAngle, 0, 0))


    serial.writeLine("hue: " + hueAngle)
    serial.writeLine("sat: " + satDist)

    // serial.writeLine("" + (swapBytes(register) & 0xFFFF))

    // serial.writeLine("" + getEncoderRawAngle())
    basic.pause(110)

})