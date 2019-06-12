import QtQuick 2.0
import QtQuick.Controls 2.2

import NinepunchGlobals 1.0

import "../Components"
import "SettingsPage"

import "../js/fonticons.js" as FontIcons

Page {
    property bool useBackButton: true
    title: "Log In"

    FloatingCard{

        SettingsPageHeaderLabel{ headerLabel: "Log in" }

        Item{
            Label{
                text: "Ninepunch uses external services to authenticate. This way you only have to concentrate on keeping that service secure.\n \nPlease use a service below:"
                wrapMode: Text.WrapAtWordBoundaryOrAnywhere
                width: parent.width
                anchors.fill: parent

                anchors.margins: 24

                opacity: 0.75

            }
            width: parent.width
            height: 128
        }

        Column{
            width: 256
            anchors.horizontalCenter: parent.horizontalCenter

            SideBarElement{ glyph: FontIcons.Ionicons.social_github; text: "Github" }
            SideBarElement{ glyph: FontIcons.Ionicons.steam; text: "Steam" }
            SideBarElement{ glyph: FontIcons.Ionicons.social_facebook; text: "Facebook" }
            SideBarElement{ glyph: FontIcons.Ionicons.social_twitter; text: "Twitter" }
            SideBarElement{ glyph: FontIcons.Ionicons.social_google; text: "Google" }
        }

        Item{
            width: 1
            height: 32
        }
    }

}
