import QtQuick 2.15
import QtQuick.Controls 2.15
import QtMultimedia 2.15

Pane
{
    id: bottomBar

    property MediaPlayer player

    Slider {
        id: volumeSlider
        anchors.left: parent.left
        anchors.right: playButton.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        value: 0.5
        onMoved: player.audioOutput.volume = volumeSlider.value
    }

    Button {
        id: playButton
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        width: 0.25 * parent.width
        checkable: true
        checked: false
        onToggled: {
            if (checked)
            {
                console.log("Playing...")
                player.play()
            }
            else
            {
                console.log("Pausing...")
                player.pause()
            }
        }

        Image {
            anchors.centerIn: parent
            height: 0.8 * playButton.height
            width: height
            source: playButton.checked ? "/Images/icPause.png" : "/Images/icPlay.png"
        }
    }
}
