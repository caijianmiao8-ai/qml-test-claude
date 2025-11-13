import QtQuick 6.5

Item {
    id: root
    property color color: "#FFFFFF"
    property int size: 24
    implicitWidth: size
    implicitHeight: size

    Canvas {
        anchors.fill: parent
        onPaint: {
            var ctx = getContext("2d")
            ctx.resetTransform()
            ctx.clearRect(0, 0, width, height)
            ctx.lineWidth = 2
            ctx.strokeStyle = root.color
            var margin = width * 0.1
            ctx.strokeRect(margin, margin, width - margin * 2, height * 0.65 - margin)
            ctx.beginPath()
            ctx.moveTo(width * 0.35, height * 0.75)
            ctx.lineTo(width * 0.65, height * 0.75)
            ctx.lineTo(width * 0.75, height * 0.9)
            ctx.lineTo(width * 0.25, height * 0.9)
            ctx.closePath()
            ctx.stroke()
        }
    }
}
