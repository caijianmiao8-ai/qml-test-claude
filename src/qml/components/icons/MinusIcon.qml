import QtQuick 6.5

Item {
    id: root
    property color color: "#FFFFFF"
    property int size: 16
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
            ctx.moveTo(width * 0.2, height * 0.5)
            ctx.lineTo(width * 0.8, height * 0.5)
            ctx.stroke()
        }
    }
}
