pragma Singleton
import QtQuick 2.0
import QtQuick.Window 2.2

import QtQuick.Controls.Material 2.2

QtObject {

    //Desktop mode
    property int desktopModeContentWidth: 768

    //Theme
    property color mainColor: "#E93C4F";
    property color mainColorDisabled: "#A20E30";
    property color backgroundColor: "#EEE";
    property color deeperBackgroundColor: "#e6ecf0";
    property color overlayColor: "#ddd";
    property color secondaryColor: "#2D4255";

    property bool isDarkMode: false;

    property bool loggedIn: false

    onIsDarkModeChanged: {
        //changeDarkMode();
    }

    function setupLightMode(){
        mainColor ="#E93C4F";
        mainColorDisabled = "#A20E30";
        backgroundColor = "#EEE";
        deeperBackgroundColor = "#e6ecf0";
        overlayColor = "#ddd";
        secondaryColor = "#2D4255";

        isDarkMode = false;
    }

    function setupDarkMode(){
        mainColor = "#202529";
        mainColorDisabled = "#1C2024";
        backgroundColor = "#202529";
        overlayColor = "#1C2024";
        secondaryColor = "#FF8C12";

        isDarkMode = true;
    }

    function twitterNightMode(){
        mainColor = "#243447";
        mainColorDisabled = "#1a2533";
        backgroundColor = "#1b2836";
        deeperBackgroundColor = "#141d26"
        overlayColor = "#243447";
        secondaryColor = "#1da1f2";
        //secondaryColor = "#FF8C12";

        isDarkMode = true;
    }

}
