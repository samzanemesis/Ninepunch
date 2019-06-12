import QtQuick 2.7
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.3

import QtQuick.Controls.Material 2.2
import QtQuick.Controls.Universal 2.0

import "Android"
import "Components"

import "js/emoteLoader.js" as EmoteLoader

import NinepunchGlobals 1.0


ApplicationWindow {
    id: app
    visible: true
    width: 360
    height: 640
    title: qsTr("Ninepunch")

    property bool isMaximized: false;
    Material.theme: Globals.isDarkMode ? Material.Dark : Material.Light
    Material.accent: Globals.secondaryColor
    Material.background: Globals.deeperBackgroundColor

    Universal.theme: Globals.isDarkMode ? Universal.Dark : Universal.Light
    Universal.accent: Globals.secondaryColor
    Universal.background: Globals.deeperBackgroundColor


    Rectangle{
        anchors{
            fill: parent
        }

        color: "transparent"
        border.width: 0.5
        border.color: app.active ? "#e09d21" : "black"
        z:999
        opacity: app.active ? 0.5 : 0.2
        visible: !isMaximized
    }

    //Dummy stuff
    FontLoader {
        source: "res/fonts/fontawesome-webfont.ttf"
    }
    FontLoader {
        source: "res/fonts/ionicons.ttf"
    }

    header: HeaderComponent{
        id: headerComponent
        isThread: true
        title: stackView.currentItem.title
        useBackButton: stackView.currentItem.useBackButton
    }

    //Side panel
    SidePanel{ id: sidePanel }

    //Post page
    StackView{
        id: stackView
        anchors.fill: parent;
        initialItem: ThreadPage{
            id: threadPage
        }
    }

    Component.onCompleted: {
        EmoteLoader.loadEmotes();
        //Globals.twitterNightMode();
    }
}


