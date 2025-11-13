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
            ctx.save()
            ctx.translate(width / 2, height / 2)
            var teeth = 6
            var outer = width * 0.45
            var inner = width * 0.3
            ctx.beginPath()
            for (var i = 0; i < teeth * 2; ++i) {
                var r = (i % 2 === 0) ? outer : inner
                var angle = Math.PI * i / teeth
                ctx.lineTo(Math.cos(angle) * r, Math.sin(angle) * r)
            }
            ctx.closePath()
            ctx.stroke()
            ctx.beginPath()
            ctx.arc(0, 0, width * 0.18, 0, Math.PI * 2)
            ctx.stroke()
            ctx.restore()
        }
    }
}
