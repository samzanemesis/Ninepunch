import QtQuick 2.0
import QtQuick.Layouts 1.3
import QtQuick.Controls 2.2
import QtGraphicalEffects 1.0

import NinepunchGlobals 1.0

import "../js/fonticons.js" as FontIcons
import "../Pages"
import "../Android"
import ".."


BlurRectangle{
    id: sidePanel
    width: 256
    height: parent.height
    element: stackView
    z: 9999
    state: "CLOSED"

    visible: x > -width

    radius: 127

    //color: Globals.mainColor

    states: [
        State { name: "OPEN"
            PropertyChanges {
                target: sidePanel
                x: 0
            }
        },
        State { name: "CLOSED"
            PropertyChanges {
                target: sidePanel
                x: -width
            }
        }
    ]
    transitions: [
        Transition {
            NumberAnimation {
                properties: "x"
                duration: 500
                easing.type: Easing.OutExpo
                easing.period: 0.9
            }
        }
    ]

    //Cheap shadow
    LinearGradient{
        start: Qt.point(0, 0)
        end: Qt.point(width, 0)
        gradient: Gradient {
            GradientStop { position: 0.0; color: Qt.rgba(0,0,0,0.05) }
            GradientStop { position: 1.0; color: "transparent" }
        }
        anchors.left: parent.right
        width: 16
        height: parent.height
    }

    //WTF
    Rectangle{
        anchors.left: parent.right
        height: parent.height
        width: threadPage.width - (parent.x + parent.width)

        color: "black"

        opacity: (1-( Math.abs(parent.x) / parent.width )) * 0.25
        MouseArea{
            anchors.fill: parent
            onClicked: sidePanel.state = "CLOSED"
        }
    }

    ColumnLayout{
        width: parent.width
        height: parent.height
        spacing: 1

        Rectangle{
            width: parent.width
            height: parent.width * 0.5625
            color: Globals.backgroundColor
            visible: Globals.loggedIn

            Column{
                Label{ text:"Sam" }
                Label{ text:"150 coins" }

                anchors.bottom: parent.bottom
                anchors.left: parent.left
                anchors.margins: 16
            }
            PostToolButton{
                glyph: FontIcons.Ionicons.android_exit

                glyphOpacity: 1
                useTheme: true

                anchors{
                    bottom: parent.bottom
                    right: parent.right
                }

                onClicked: console.warn("Are you sure you want to log out etc")
            }
        }

        SideBarElement{
            text: "Log in"
            glyph: FontIcons.Ionicons.ios_contact_outline
            onClicked: parent.pushPage( loginPage )
            visible: !Globals.loggedIn
        }

        SideBarElement{
            text: "Pinned Threads"
            glyph: FontIcons.Ionicons.ios_bookmarks_outline
            onClicked: parent.pushPage( pinnedThreadsPage )
        }
        SideBarElement{
            text: "Event Log"
            glyph: FontIcons.Ionicons.ios_calendar_outline

            onClicked: parent.pushPage( eventLogPage )
        }
        SideBarElement{
            glyph: FontIcons.Ionicons.ios_cart_outline
            text: "Shop"

            onClicked: parent.pushPage( shopPage )
        }

        Item{Layout.fillHeight: true}

        Rectangle{
            width: parent.width
            height: 1
            color: Globals.mainColor
        }

        SideBarElement{
            glyph: FontIcons.Ionicons.ios_download_outline
            text: "Data Saving"
            isToggleSwitch: true
        }
        SideBarElement{
            isToggleSwitch: true
            text: "Night Mode"
            glyph: FontIcons.Ionicons.ios_moon_outline
            glyphSize: 32

            onPressed: {
                //switchState = !switchState;

                if(switchState)
                    Globals.setupLightMode();
                else
                    Globals.twitterNightMode();
            }
        }
        SideBarElement{
            glyph: FontIcons.Ionicons.ios_gear_outline
            text: "Settings"
            onClicked: parent.pushPage( settingsPage )

        }

        function pushPage( page ){
            stackView.push( page );
            sidePanel.state = "CLOSED";
        }
    }
    Component{ id: settingsPage; SettingsPage{} }
    Component{ id: shopPage; ShopPage{} }
    Component{ id: eventLogPage; EventLogPage{} }
    Component{ id: pinnedThreadsPage; PinnedThreadsPage{} }
    Component{ id: loginPage; LoginPage{} }
}


