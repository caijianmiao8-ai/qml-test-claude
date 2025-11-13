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
            var margin = width * 0.25
            ctx.strokeRect(margin, margin * 0.4, width - margin * 2, height - margin * 0.8)
            ctx.beginPath()
            ctx.moveTo(width / 2, height * 0.85)
            ctx.lineTo(width / 2, height * 0.85)
            ctx.stroke()
        }
    }
}
