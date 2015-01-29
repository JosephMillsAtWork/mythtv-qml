import QtQuick 2.0
import QtQuick.LocalStorage 2.0
import "dbUtil.js" as DataBase
import "Util.js" as Util
Rectangle{
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property alias  buttonColor: themeRec.color
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property string buttonState: themeRec.state
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property alias  name: themeName.text
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property alias nameColor: themeName.color
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property int  namepxSize: themeName.font.pixelSize
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property string nameEffect: themeName.style
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property string nameEffectColor: themeName.styleColor
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property string nameWraping: themeName.wrapMode
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property double nameMaxLineCount: themeName.maximumLineCount
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property bool nameBold: themeName.font.bold
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property  string nameWeight: themeName.font.weight
    property string nameFamily: themeName.font.family
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property bool nameItalic: themeName.font.italic
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property real nameLetterSpacing: themeName.font.letterSpacing
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property bool  nameUnderLined: themeName.font.underline

    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property alias slope: themeRec.gradient
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property alias radius:  themeRec.radius
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property alias state: themeRec.state
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property color borderColor: themeRec.border.color
    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    property int borderWidth: themeRec.border.width

    /*!
          \preliminary
          The background Image that one wants to use for there Coverflow page
          */
    signal buttonClick()
    id: themeRec
    color:  [undefined]  ? "#88000000" :    parent.mythButtonColor
    width:  parent.width
    height: parent.height
    state: state
    radius: radius
    border.color: borderColor
    border.width: borderWidth
    MouseArea{
        id:themeMouseArea
        anchors.fill: themeRec
        hoverEnabled: true
        enabled: true
        onEntered: themeRec.state = "hovered"
        onExited: themeRec.state = "exited"
        onClicked: buttonClick()
        Keys.onEnterPressed: buttonClick()
        Keys.onReturnPressed: buttonClick()
        Component.onCompleted: {
            themeMouseArea.clicked
        }
    }
    Text {
        id: themeName
        text: parent.name
        styleColor:  parent.nameEffectColor
        font.family: parent.nameFamily
        anchors.centerIn: themeMouseArea
        font.pixelSize: text === "" ? 0 : parent.namepxSize
        color: parent.nameColor
    }
}
