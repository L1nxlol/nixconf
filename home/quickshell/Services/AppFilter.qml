// Flat array built once from DesktopEntries — rebuild only if entries change (rare)
property var appList: []       // [{name, icon, exec}]
property var nameToEntry: ({}) // lookup: name -> {name, icon, exec}
property var results: []       // filtered/sorted app objects, in display order

function buildAppList() {
    appList = []
    nameToEntry = {}
    // VERIFY against docs: iterating DesktopEntries.applications (or similar)
    for (var i = 0; i < DesktopEntries.applications.count; i++) {
        var e = DesktopEntries.applications.get(i)
        var item = { name: e.name, icon: e.icon, exec: e.execString }
        appList.push(item)
        nameToEntry[e.name] = item
    }
}

function filter(query) {
    if (query.length === 0) {
        results = appList
        return
    }
    fzfProcess.query = query
    fzfProcess.running = true
}

// Process: Quickshell.Io — command: ["fzf", "--filter", query]
// stdin gets one app name per line, stdout returns them filtered+sorted
function onFzfFinished(stdoutText) {
    var names = stdoutText.split("\n").filter(n => n.length > 0)
    results = names.map(n => nameToEntry[n]).filter(item => item !== undefined)
}

function writeStdinNames() {
    return appList.map(item => item.name).join("\n")
}
