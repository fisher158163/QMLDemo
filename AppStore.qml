import QtQuick 2.0
import QtQuick.Controls 2.2
import QtQuick.Window
// import "qrc:/Tools.js" as Tool

Window {
    width: 1150
    height: 750
    minimumWidth: 900
    minimumHeight: 500
    visible: true
    // 无边框窗口
    // flags: Qt.FramelessWindowHint
    title: qsTr("App Store")

    // selectIndex
    // var preSelectIndex = 0

    Item {
        id: item
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.left: parent.left
            width: 200
            color: generateColor("2C2C2D")

            ListModel {
                id: listModel

                ListElement {
                    name: "探索"
                }

                ListElement {
                    name: "创作"
                }

                ListElement {
                    name: "工作"
                }

                ListElement {
                    name: "游戏"
                }

                ListElement {
                    name: "开发"
                }

                ListElement {
                    name: "类别"
                }

                ListElement {
                    name: "更新"
                }
            }

            ListView {
                    id: list
                    // spacing: 10
                    width: parent.width-30
                    height: parent.height-15
                    topMargin: 15
                    leftMargin: 15
                    rightMargin: 15
                    model: listModel
                    // 默认选中第一个
                    currentIndex: 0
                    // orientation: Qt.Horizontal
                    // highlightFollowsCurrentItem: false
                    delegate: Rectangle {
                        width: list.width
                        height: 45
                        // 使model的颜色透明，为了显示出highlight颜色
                        color:"transparent"
                        Text {
                            // 设置文字属性
                            text: name
                            color: "white"
                            font.bold: true
                            font.pixelSize: 20
                            // 设置文字居中
                            anchors.centerIn: parent
                        }

                        MouseArea {
                            anchors.fill: parent
                            onClicked: {
                                 // 点击选中哪一项
                                list.currentIndex = index
                                 // getComponents
                                stack.push(getComponents(index))
                                // preSelectIndex
                                // preSelectIndex = index
                            }
                        }
                    }

                    // 高亮
                    highlight: Rectangle {
                        width: parent.width
                        height: 45
                        radius: 6
                        color: generateColor("454646")
                        y: list.currentItem.y
                        Behavior on y {
                            // 点击选中的时候会有个动画
                            SpringAnimation {
                                spring: 3
                                damping: 0.25
                            }
                        }
                    }
                }
        }

//        Rectangle {
//            id: rectangle2
//            anchors.top: parent.top
//            anchors.bottom: parent.bottom
//            anchors.left: rectangle1.right
//            anchors.right: parent.right
//            color: "blue"
//        }

        StackView {
                id: stack
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.left: rectangle1.right
                anchors.right: parent.right
                // orientation: Qt.Vertical
                Component.onCompleted: {
                    stack.push(discoverView)
                }

                // 转场动画
                popEnter: Transition{}
                    popExit: Transition {
                        NumberAnimation {
                            properties: "y"
                            from: 0
                            to: stack.height
                            duration: 250
                        }
                    }
                    pushEnter: Transition {
                        NumberAnimation {
                            properties: "y"
                            from: stack.height
                            to: 0
                            duration: 250
                        }
                    }
                    pushExit: Transition{}
                    replaceEnter: Transition{}
                    replaceExit: Transition{}
            }

        DiscoverView {
            id: discoverView
        }

        CreateView {
            id: createView
        }

        WorkView {
            id: workView
        }

        GameView {
            id: gameView
        }

        DevelopView {
            id: developView
        }

        CategoryView {
            id: categoryView
        }

        UpdateView {
            id: updateView
        }

    }

    // generateColor
    function generateColor(hexString) {
        var decimal = parseInt(hexString, 16)
        var red = (decimal >> 16) & 255
        var green = (decimal >> 8) & 255
        var blue = decimal & 255
        var color = Qt.rgba(red / 255, green / 255, blue / 255, 1)
        return color
    }

    // getComponents
    function getComponents(index) {
        var component = discoverView
        if (index === 0) {
            component = discoverView
        } else if (index === 1) {
            component = createView
        } else if (index === 2) {
            component = workView
        } else if (index === 3) {
            component = gameView
        } else if (index === 4) {
            component = developView
        } else if (index === 5) {
            component = categoryView
        } else if (index === 6) {
            component = updateView
        }
        return component
    }

}
