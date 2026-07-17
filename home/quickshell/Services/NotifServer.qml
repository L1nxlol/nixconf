pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Services.Notifications

Singleton {
    id: root
    Component.onCompleted: console.log("NotifServer: singleton loaded")

    property var history: []
    property var latest: null

    ListModel {
        id: activePopupsModel
    }
    property alias activePopups: activePopupsModel

    signal newNotification(var notif)

    NotificationServer {
        id: server
        onNotification: notif => {
            console.log("NotifServer: received notification from", notif.appName, "-", notif.summary)

            const entry = {
    notifId: notif.id,
    appName: notif.appName,
    summary: notif.summary,
    body: notif.body,
    appIcon: notif.appIcon,
    urgency: notif.urgency,
    timestamp: Date.now()
}
            root.history = [entry, ...root.history]
            activePopupsModel.insert(0, entry)
            root.latest = entry
            root.newNotification(entry)
            console.log("NotifServer: history now has", root.history.length, "entries")
        }
    }

    function clearHistory() {
        root.history = []
    }

function expirePopup(id) {
    for (let i = 0; i < activePopupsModel.count; i++) {
        if (activePopupsModel.get(i).notifId === id) {
            activePopupsModel.remove(i)
            break
        }
    }
}

function removeEntry(id) {
    root.history = root.history.filter(e => e.notifId !== id)
}
}
