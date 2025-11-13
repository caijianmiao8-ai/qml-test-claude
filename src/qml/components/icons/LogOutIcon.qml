import QtQuick 6.5

Item {
    id: root
    property color color: "#FFFFFF"
    property int size: 20
    implicitWidth: size
    implicitHeight: size

    Canvas {
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d")
            ctx.resetTransform()
            ctx.clearRect(0, 0, width, height)
            ctx.strokeStyle = root.color
            ctx.lineWidth = 2
            ctx.beginPath()
            ctx.moveTo(width * 0.15, height * 0.2)
            ctx.lineTo(width * 0.55, height * 0.2)
            ctx.lineTo(width * 0.55, height * 0.8)
            ctx.lineTo(width * 0.15, height * 0.8)
            ctx.closePath()
            ctx.stroke()
            ctx.beginPath()
            ctx.moveTo(width * 0.55, height * 0.5)
            ctx.lineTo(width * 0.85, height * 0.5)
            ctx.stroke()
            ctx.beginPath()
            ctx.moveTo(width * 0.7, height * 0.35)
            ctx.lineTo(width * 0.85, height * 0.5)
            ctx.lineTo(width * 0.7, height * 0.65)
            ctx.stroke()
        }
    }
}
