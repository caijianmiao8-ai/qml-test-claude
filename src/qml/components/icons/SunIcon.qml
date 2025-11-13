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
            ctx.arc(width / 2, height / 2, width * 0.25, 0, Math.PI * 2)
            ctx.stroke()
            for (var i = 0; i < 8; ++i) {
                var angle = Math.PI / 4 * i
                var sx = width / 2 + Math.cos(angle) * width * 0.4
                var sy = height / 2 + Math.sin(angle) * height * 0.4
                var ex = width / 2 + Math.cos(angle) * width * 0.5
                var ey = height / 2 + Math.sin(angle) * height * 0.5
                ctx.beginPath()
                ctx.moveTo(sx, sy)
                ctx.lineTo(ex, ey)
                ctx.stroke()
            }
        }
    }
}
