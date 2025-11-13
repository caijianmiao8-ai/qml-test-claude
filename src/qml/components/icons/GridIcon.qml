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
            var cell = width / 3
            for (var i = 0; i < 3; ++i) {
                for (var j = 0; j < 3; ++j) {
                    var x = j * cell + 1
                    var y = i * cell + 1
                    ctx.strokeRect(x, y, cell - 2, cell - 2)
                }
            }
        }
    }
}
