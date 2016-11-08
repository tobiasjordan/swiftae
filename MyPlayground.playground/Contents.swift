//: Playground - noun: a place where people can play

// TO DO: delete this playground from project once finished with ad-hoc testing. (Running application commands in playgrounds is wildly unsafe, as *all* commands in the playground are re-executed *every time* the user makes a change - this isn't a problem for safe, idempotent commands like `get` and `count`, but it's a serious pain with commands like `make` and a serious risk with commands like `move` and `delete`. This is a flaw in playgrounds that affects ALL code that has external side-effects, not just SwiftAutomation.)

import Cocoa
import SwiftAutomation


let iitunes = ITunes()
let textedit = TextEdit()
let finder = Finder()


/*
let state: ITU = try itunes.playerState.get()
if state == ITU.playing {
    print(try itunes.currentTrack.name.get())
} else {
    print(state)
}

try TextEdit().documents.name.get() as [String]

print()
print(try Finder().home.files.name.get())

print()
print(try Finder().home.files[1].get())

/*

let doc: TEDItem = try textedit.make(new: TED.document) // TO DO: Swift will execute this and every other line *every single time* the user edits code within this playground, causing multiple documents to be created; because what could *possibly* go wrong just by blindly assuming every single function call the user makes is 100% idempotent and safe? This makes playgrounds largely useless for interactive/tutorial use (ironic since the CLI `swift` command seems to emulate a REPL just fine).

try doc.name.get() as String


*/

try finder.home.get(requestedType: FIN.alias) as URL

//try itunes.tracks.any.play()

//try textedit.launch()
*/

//try finder.files.fileType.get()

//try finder.files.fileType.get() as [MayBeMissing<String>]

//try finder.files.fileType.get() as [String?]

//textedit.isRunning

// try itunes.playerState.get() as String // note: this will return four-char-code, which probably isn't what user wanted; to get the symbol's name as String, use `(try itunes.playerState.get() as Symbol).name` instead


//try textedit.documents.get() as NSArray //<TEDItem>


//let result = try textedit.documents.paragraphs.get() as [Any]
//print(type(of:result))
//print(result)


//let v = try finder.home.files.name.get() as NSArray//Set<AnyHashable>

//type(of:v)
do {
let result = try TextEdit().documents.path.get() as [String?]

print(result)
} catch {
print(error)
}



//try TextEdit().documents[1].path.set(to:nil)


// CustomReflectable FAIL: Could not cast value of type 'SwiftAutomation.ObjectSpecifier' (0x10d705c88) to 'MyPlayground_Sources.FINItem' (0x10d5433c8).
//try finder.home.files[2, 7].get() //as [FINItem]

// TED.document // CustomReflectable is buggy and crashes


//try finder.home.files[1..<4].name.get() // note: this form is not supported


[AE(code:"2345")]

[AEApp.elements("docu").property("ctxt")]




