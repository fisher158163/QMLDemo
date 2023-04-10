import QtQuick
import QtQuick.Window

Window {
    width: 900
    height: 500
    minimumWidth: 900
    minimumHeight: 500
    visible: true
    // 无边框窗口
    // flags: Qt.FramelessWindowHint
    title: qsTr("QML Demo")

    Item {
        id: item
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            // anchors.centerIn: parent
            width: parent.width/3
            color: "red"

            Text {
                id: text1
                text: qsTr("Rectangle1")
                color: "white"
                font.pixelSize: 30
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: rectangle2
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: rectangle1.right
            width: parent.width/3
            color: "blue"

            Text {
                id: text2
                text: qsTr("Rectangle2")
                color: "white"
                font.pixelSize: 30
                anchors.centerIn: parent
            }
        }

        Rectangle {
            id: rectangle3
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: rectangle2.right
            width: parent.width/3
            color: "cyan"

            Text {
                id: text3
                text: qsTr("Rectangle3")
                color: "white"
                font.pixelSize: 30
                anchors.centerIn: parent
            }
        }
    }

//    MouseArea {
//        id: dragRegion
//        anchors.fill: parent
//        property point clickPos:"0,0"
//        onPressed:{
//        clickPos = Qt.point(mouse.x, mouse.y)
//        }
//        onPositionChanged: {
//        // 鼠标偏移量
//        var delta = Qt.point(mouse.x-clickPos.x, mouse.y-clickPos.y)
//        // 如果mainwindow继承自QWidget,用setPos
//        mainwindow.setX(mainwindow.x+delta.x)
//        mainwindow.setY(mainwindow.y+delta.y)
//        }
//    }

}
