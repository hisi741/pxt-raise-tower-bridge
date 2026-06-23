namespace ColorSensor {

    /*
    * Enums here taken from Arduino library for the OPT4048 High Speed High Precision Tristimulus XYZ
    * Color Sensor.
    *
    * This is a library for the Adafruit OPT4048 breakout
    * ----> https://www.adafruit.com/products/6334
    *
    * Adafruit invests time and resources providing this open source code,
    * please support Adafruit and open-source hardware by purchasing
    * products from Adafruit!
    *
    * Written by Limor Fried/Ladyada for Adafruit Industries.
    *
    * MIT license, all text here must be included in any redistribution.
    */

    enum RangeSetting {
        OPT4048_RANGE_2K_LUX = 0,   ///< 2.2 klux
        OPT4048_RANGE_4K_LUX = 1,   ///< 4.5 klux
        OPT4048_RANGE_9K_LUX = 2,   ///< 9 klux
        OPT4048_RANGE_18K_LUX = 3,  ///< 18 klux
        OPT4048_RANGE_36K_LUX = 4,  ///< 36 klux
        OPT4048_RANGE_72K_LUX = 5,  ///< 72 klux
        OPT4048_RANGE_144K_LUX = 6, ///< 144 klux
        OPT4048_RANGE_AUTO = 12     ///< Auto-range
    }

    enum ConversionTime {
        OPT4048_CONVERSION_TIME_600US = 0,  ///< 600 microseconds
        OPT4048_CONVERSION_TIME_1MS = 1,    ///< 1 millisecond
        OPT4048_CONVERSION_TIME_1_8MS = 2,  ///< 1.8 milliseconds
        OPT4048_CONVERSION_TIME_3_4MS = 3,  ///< 3.4 milliseconds
        OPT4048_CONVERSION_TIME_6_5MS = 4,  ///< 6.5 milliseconds
        OPT4048_CONVERSION_TIME_12_7MS = 5, ///< 12.7 milliseconds
        OPT4048_CONVERSION_TIME_25MS = 6,   ///< 25 milliseconds
        OPT4048_CONVERSION_TIME_50MS = 7,   ///< 50 milliseconds
        OPT4048_CONVERSION_TIME_100MS = 8,  ///< 100 milliseconds
        OPT4048_CONVERSION_TIME_200MS = 9,  ///< 200 milliseconds
        OPT4048_CONVERSION_TIME_400MS = 10, ///< 400 milliseconds
        OPT4048_CONVERSION_TIME_800MS = 11  ///< 800 milliseconds
    }

    enum OperatingMode {
        OPT4048_MODE_POWERDOWN = 0,    ///< Power-down mode
        OPT4048_MODE_AUTO_ONESHOT = 1, ///< Forced auto-range one-shot mode
        OPT4048_MODE_ONESHOT = 2,      ///< One-shot mode
        OPT4048_MODE_CONTINUOUS = 3    ///< Continuous mode
    }

    enum FaultCount {
        OPT4048_FAULT_COUNT_1 = 0, ///< 1 fault count (default)
        OPT4048_FAULT_COUNT_2 = 1, ///< 2 consecutive fault counts
        OPT4048_FAULT_COUNT_4 = 2, ///< 4 consecutive fault counts
        OPT4048_FAULT_COUNT_8 = 3  ///< 8 consecutive fault counts
    }

    enum InterruptMode {
        OPT4048_INT_CFG_SMBUS_ALERT = 0,     ///< SMBUS Alert
        OPT4048_INT_CFG_DATA_READY_NEXT = 1, ///< INT Pin data ready for next channel
        OPT4048_INT_CFG_DATA_READY_ALL = 3   ///< INT Pin data ready for all channels
    }

    export function configureColorSensor() {
        //00 (config stuff) 1100 (0xC, auto-range lux) 1000 (0x8, 100ms conversion time) 11 (3, cont. conversion) 1 (int) 0 (int pol.) 00 (fault behav.)
        //0011 0010 0011 1000
        // let confReg = 0b0011001000111000
        let rangeSetting = RangeSetting.OPT4048_RANGE_AUTO
        let convTime = ConversionTime.OPT4048_CONVERSION_TIME_100MS
        let operatingMode = OperatingMode.OPT4048_MODE_CONTINUOUS
        let latchMode = 1
        let interruptPolarity = 0
        let faultCountMode = FaultCount.OPT4048_FAULT_COUNT_1
        let confReg = (0 << 14) | (rangeSetting << 10) | (convTime << 6) | (operatingMode << 4) | (latchMode << 3) | (interruptPolarity << 2) | (faultCountMode << 0)

        let writeBuf = pins.createBuffer(3)
        writeBuf.setNumber(NumberFormat.UInt8LE, 0, 0xA)
        writeBuf.setNumber(NumberFormat.UInt8LE, 1, (confReg & 0xFF00) >> 8)
        writeBuf.setNumber(NumberFormat.UInt8LE, 2, confReg & 0x00FF)

        pins.i2cWriteBuffer(colorI2CAddr, writeBuf, false)
    }


    export function getChannelReadingsRaw(): number[] {
        pins.i2cWriteNumber(colorI2CAddr, 0x00, NumberFormat.UInt8LE, true) //set pointer at register 0
        let i2cBuffer = pins.i2cReadBuffer(colorI2CAddr, 16, false) //read all channels
        let buf = i2cBuffer.toArray(NumberFormat.UInt16BE) //big endian because the MSB comes over the wire first so gets stored in the buffer first

        let results = [0, 0, 0, 0]

        for (let ch = 0; ch < 4; ch++) { //iterate for each channel, since offset is the same
            let exponent = buf[ch * 2] >> 12 & 0x000F //exponent is first most significant 4 bits of the first register of each channel
            let msb = buf[ch * 2] & 0x0FFF //most significant byte-and-a-half of mantissa is the least significant 3 bytes of the first register of each channel
            let lsb = buf[ch * 2 + 1] >> 8 & 0x00FF //least significant half byte of mantissa is the most significant byte of the second register of each channel
            let mantissa = msb << 8 | lsb

            let value = mantissa << exponent //per adafruit example code, this is fine because mantissa is 20 bits and max exponent value is 6, so this is a max 26 bit value (which fits in 32 bits) (so this *doesn't* need to be floating point)

            results[ch] = value
            // serial.writeLine("ch" + ch + ": " + value)
        }

        return results
    }

    /*
    * returns the channel readings, converted to RGB values. Note: these are linear RGB values, not sRGB
    */
    export function getReadingRGB(): number[] {
        let rawReadings = ColorSensor.getChannelReadingsRaw()

        let X = rawReadings[0]
        let Y = rawReadings[1]
        let Z = rawReadings[2]

        // let sum = X + Y + Z
        // X = X / sum
        // Y = Y / sum
        // Z = Z / sum

        //reference https://getreuer.info/posts/colorspace/
        let R = 3.2406 * X - 1.5371 * Y - 0.4986 * Z
        let G = -0.969256 * X + 1.875992 * Y + 0.041556 * Z
        let B = 0.055648 * X - 0.204043 * Y + 1.057311 * Z

        // serial.writeLine("R: " + R)
        // serial.writeLine("G: " + G)
        // serial.writeLine("B: " + B)

        return [R, G, B]
    }

    export function getReadingCIExyChromaticity(): number[] {
        let rawVals = getChannelReadingsRaw()

        let ch0 = rawVals[0]
        let ch1 = rawVals[1]
        let ch2 = rawVals[2]
        let ch3 = rawVals[3]


        let m0x = 2.34892992e-04;
        let m0y = -1.89652390e-05;
        let m0z = 1.20811684e-05;
        let m0l = 0;

        let m1x = 4.07467441e-05;
        let m1y = 1.98958202e-04;
        let m1z = -1.58848115e-05;
        let m1l = 2.15e-3;

        let m2x = 9.28619404e-05;
        let m2y = -1.69739553e-05;
        let m2z = 6.74021520e-04;
        let m2l = 0;

        let m3x = 0;
        let m3y = 0;
        let m3z = 0;
        let m3l = 0;


        let X = ch0 * m0x + ch1 * m1x + ch2 * m2x + ch3 * m3x;
        let Y = ch0 * m0y + ch1 * m1y + ch2 * m2y + ch3 * m3y;
        let Z = ch0 * m0z + ch1 * m1z + ch2 * m2z + ch3 * m3z;
        let L = ch0 * m0l + ch1 * m1l + ch2 * m2l + ch3 * m3l; //luminance in units of lux

        // serial.writeLine("X: " + X)
        // serial.writeLine("Y: " + Y)
        // serial.writeLine("Z: " + Z)
        // serial.writeLine("L: " + L)

        let R = 3.2406 * X - 1.5371 * Y - 0.4986 * Z
        let G = -0.969256 * X + 1.875992 * Y + 0.041556 * Z
        let B = 0.055648 * X - 0.204043 * Y + 1.057311 * Z

        serial.writeLine("R: " + R)
        serial.writeLine("G: " + G)
        serial.writeLine("B: " + B)

        let sum = X + Y + Z
        let CIEx = 0
        let CIEy = 0
        if (sum > 0) {
            CIEx = X / sum;
            CIEy = Y / sum;
        }

        // serial.writeLine("CIEx: " + CIEx)
        // serial.writeLine("CIEy: " + CIEy)

        return [CIEx, CIEy]
    }

    export function getRawHueAngle(){
        let CIExy = getReadingCIExyChromaticity()

        //blue at approx 38 deg, red 276, green 186
        let hueAngle = (Math.atan2(CIExy[0] - 0.3333, CIExy[1] - 0.3333) * 180 / Math.PI) + 180

        hueAngle = 360 - hueAngle
        hueAngle = hueAngle + 278
        if (hueAngle > 360){
            hueAngle = hueAngle - 360
        }

        // serial.writeLine("hue: " + hueAngle)

        return hueAngle
    }

    export function getRawSatDist() {
        let CIExy = getReadingCIExyChromaticity()

        let satDist = Math.sqrt(Math.pow(CIExy[0] - 0.3333, 2) + Math.pow(CIExy[1] - 0.3333, 2))

        // serial.writeLine("hue: " + hueAngle)

        return satDist
    }

}