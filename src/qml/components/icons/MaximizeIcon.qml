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
            ctx.strokeRect(width * 0.2, height * 0.2, width * 0.6, height * 0.6)
        }
    }
}
