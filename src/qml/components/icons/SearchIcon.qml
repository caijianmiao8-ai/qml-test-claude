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
            ctx.arc(width * 0.45, height * 0.45, width * 0.3, 0, Math.PI * 2)
            ctx.stroke()
            ctx.beginPath()
            ctx.moveTo(width * 0.68, height * 0.68)
            ctx.lineTo(width * 0.9, height * 0.9)
            ctx.stroke()
        }
    }
}
