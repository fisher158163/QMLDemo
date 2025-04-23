import QtQuick 2.0
import QtQuick.Controls 2.2

Component {
        // id: createView
        Rectangle {
        color: "yellow"
        Text {
            text: "创作"
            color: "white"
            font.bold: true
            font.pixelSize: 60
            // 设置文字居中
            anchors.centerIn: parent
        }
    }
}
