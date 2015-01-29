import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import QtQuick.Window 2.0
import  MythTv 1.0
import "common/qtlook.js" as Theming
import "common"
Item{
    id: root
    width: Screen.width
    height: Screen.height
    focus: pageLoader.opacity === 1 ?   false: true
     Keys.onUpPressed: menuView.decrementCurrentIndex()
     Keys.onDownPressed: menuView.incrementCurrentIndex()
     Keys.onReturnPressed: {
        pageLoader.source = menuView.model.get(menuView.currentIndex).loaderSource
        pageLoader.opacity = 1
    }
    Rectangle{
        id: starthere
        width: parent.width
        height: parent.height
        color: "#00000000"
        BorderImage {
            id: bkgRoot
            source: "background.png"
            width: parent.width
            height: parent.height
            BorderImage {
                id: watermark
                source: menuView.model.get(menuView.currentIndex).waterMark
                state: "base"
                anchors.fill: bkgRoot
                width: root.width
                height: root.height
            }
            ListView {
                id: menuView
                width: bkgRoot.width
                height: bkgRoot.height
                model: HomeMenuModel{}
                delegate:
//                    Rectangle{
//                    id: delRec
//                        width: menuView.width / 3
//                        height: menuView.height
//                        color: "#12FFFFFF"
                        MythButton{
                                id: mediaLib
                                enabled: true
                                radius: 80
                                height: focus === true ? menuView.height / 7.7 : menuView.height / 8
                                width: focus === true ? menuView.width / 2.2: menuView.width / 2.3
//                                width: parent.width
//                                height: parent.height / 8
                                name: text
                                buttonColor: "#44FFFFFF"
                                nameColor: "white"
                                nameItalic: false
                                nameBold: false
                                nameEffect: Text.Raised
                                nameEffectColor: "grey"
                                namepxSize:  Math.round(height / 1.7)
                                onStateChanged: {
                                    if (state === "hovered"){
                                        buttonColor = Qt.darker(buttonColor,1.2)
                                        scale = 1.2
                                        watermark.source = waterMark
                                    }
                                    if (state === "exited"){
                                     buttonColor = "#44FFFFFF"
                                     scale = 1
                                     watermark.source = waterMark
                                    }
                                }

                                onButtonClick: {
                                    pageLoader.source =  loaderSource
                                    pageLoader.opacity = 1
                                }

                            }
                        }
//                    }


            Text {
                id: time
                color: "grey"
                text: Qt.formatDateTime(new Date(),"ddd MMMM d yyyy , hh:mm ap")
                font.pixelSize:  parent.width / 30
                anchors{
                    bottom:parent.bottom
                    bottomMargin: bkgRoot.height / 20
                    right: parent.right
                    rightMargin: 12
                }
            }
        }
        Loader{
            id: pageLoader
            anchors.fill: parent
            source: ""
            opacity:  0
            Behavior on opacity {
                NumberAnimation {
                    target: pageLoader
                    property: "scale"
                    from:0
                    to:1
                    duration: 1000
                    easing.type: Easing.OutExpo
                }
            }
        }
    }
}
