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
            ctx.arc(width / 2, height / 2, width * 0.4, 0, Math.PI * 2)
            ctx.stroke()
            ctx.beginPath()
            ctx.moveTo(width / 2, height * 0.45)
            ctx.lineTo(width / 2, height * 0.7)
            ctx.stroke()
            ctx.beginPath()
            ctx.moveTo(width / 2, height * 0.32)
            ctx.lineTo(width / 2, height * 0.32)
            ctx.stroke()
        }
    }
}
