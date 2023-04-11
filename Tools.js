// generateColor
function generateColor(hexString) {
    var decimal = parseInt(hexString, 16)
    var red = (decimal >> 16) & 255
    var green = (decimal >> 8) & 255
    var blue = decimal & 255
    var color = Qt.rgba(red / 255, green / 255, blue / 255, 1)
    return color
}
