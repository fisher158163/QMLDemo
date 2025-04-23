import QtQuick 2.0
import QtQuick.Controls 2.2

Component {
        // id: developView
        Rectangle {
        color: "gray"
        Text {
            text: "开发"
            color: "white"
            font.bold: true
            font.pixelSize: 60
            // 设置文字居中
            anchors.centerIn: parent
        }
    }
}
