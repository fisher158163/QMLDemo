import QtQuick 2.0
import QtQuick.Controls 2.2

Component {
        // id: updateView
        Rectangle {
        color: "orange"
        Text {
            text: "更新"
            color: "white"
            font.bold: true
            font.pixelSize: 60
            // 设置文字居中
            anchors.centerIn: parent
        }
    }
}
