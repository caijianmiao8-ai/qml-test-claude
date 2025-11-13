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
            ctx.moveTo(width * 0.1, height * 0.5)
            ctx.lineTo(width / 2, height * 0.15)
            ctx.lineTo(width * 0.9, height * 0.5)
            ctx.stroke()
            ctx.beginPath()
            ctx.rect(width * 0.25, height * 0.5, width * 0.5, height * 0.35)
            ctx.stroke()
        }
    }
}
