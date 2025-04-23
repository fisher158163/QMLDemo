import QtQuick 2.0
import QtQuick.Controls 2.2

Component {
        // id: gameView
        Rectangle {
        color: "brown"
        Text {
            text: "游戏"
            color: "white"
            font.bold: true
            font.pixelSize: 60
            // 设置文字居中
            anchors.centerIn: parent
        }
    }
 }
