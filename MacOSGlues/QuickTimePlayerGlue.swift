//
//  QuickTimePlayerGlue.swift
//  QuickTime Player.app 10.4
//  SwiftAutomation.framework 0.1.0
//  `aeglue -S 'QuickTime Player.app'`
//


import Foundation
import SwiftAutomation


/******************************************************************************/
// Create an untargeted AppData instance for use in App, Con, Its roots,
// and in Application initializers to create targeted AppData instances.

private let _specifierFormatter = SwiftAutomation.SpecifierFormatter(applicationClassName: "QuickTimePlayer",
                                                     classNamePrefix: "QTP",
                                                     typeNames: [
                                                                     0x616c6973: "alias", // "alis"
                                                                     0x2a2a2a2a: "anything", // "****"
                                                                     0x62756e64: "applicationBundleId", // "bund"
                                                                     0x7369676e: "applicationSignature", // "sign"
                                                                     0x6170726c: "applicationUrl", // "aprl"
                                                                     0x61707220: "April", // "apr\0x20"
                                                                     0x61736b20: "ask", // "ask\0x20"
                                                                     0x61637072: "audioCompressionPreset", // "acpr"
                                                                     0x61646576: "audioRecordingDevice", // "adev"
                                                                     0x766f6c75: "audioVolume", // "volu"
                                                                     0x61756720: "August", // "aug\0x20"
                                                                     0x62657374: "best", // "best"
                                                                     0x626f6f6c: "boolean", // "bool"
                                                                     0x71647274: "boundingRectangle", // "qdrt"
                                                                     0x63617365: "case_", // "case"
                                                                     0x70636c73: "class_", // "pcls"
                                                                     0x636c7274: "colorTable", // "clrt"
                                                                     0x61707374: "currentAudioCompression", // "apst"
                                                                     0x63757276: "currentCamera", // "curv"
                                                                     0x63757261: "currentMicrophone", // "cura"
                                                                     0x6d707374: "currentMovieCompression", // "mpst"
                                                                     0x73707374: "currentScreenCompression", // "spst"
                                                                     0x74696d65: "currentTime", // "time"
                                                                     0x74646173: "dashStyle", // "tdas"
                                                                     0x74647461: "data", // "tdta"
                                                                     0x64647261: "dataRate", // "ddra"
                                                                     0x6473697a: "dataSize", // "dsiz"
                                                                     0x6c647420: "date", // "ldt\0x20"
                                                                     0x64656320: "December", // "dec\0x20"
                                                                     0x6465636d: "decimalStruct", // "decm"
                                                                     0x64696163: "diacriticals", // "diac"
                                                                     0x636f6d70: "doubleInteger", // "comp"
                                                                     0x6475726e: "duration", // "durn"
                                                                     0x656e6373: "encodedString", // "encs"
                                                                     0x656e756d: "enumerator", // "enum"
                                                                     0x45505320: "EPSPicture", // "EPS\0x20"
                                                                     0x65787061: "expansion", // "expa"
                                                                     0x65787465: "extendedFloat", // "exte"
                                                                     0x66656220: "February", // "feb\0x20"
                                                                     0x66737266: "fileRef", // "fsrf"
                                                                     0x66737320: "fileSpecification", // "fss\0x20"
                                                                     0x6675726c: "fileUrl", // "furl"
                                                                     0x66697864: "fixed", // "fixd"
                                                                     0x66706e74: "fixedPoint", // "fpnt"
                                                                     0x66726374: "fixedRectangle", // "frct"
                                                                     0x646f7562: "float", // "doub"
                                                                     0x6c64626c: "float128bit", // "ldbl"
                                                                     0x66726920: "Friday", // "fri\0x20"
                                                                     0x47494666: "GIFPicture", // "GIFf"
                                                                     0x63677478: "graphicText", // "cgtx"
                                                                     0x68797068: "hyphens", // "hyph"
                                                                     0x49442020: "id", // "ID\0x20\0x20"
                                                                     0x6c6f6e67: "integer", // "long"
                                                                     0x69747874: "internationalText", // "itxt"
                                                                     0x696e746c: "internationalWritingCode", // "intl"
                                                                     0x636f626a: "item", // "cobj"
                                                                     0x6a616e20: "January", // "jan\0x20"
                                                                     0x4a504547: "JPEGPicture", // "JPEG"
                                                                     0x6a756c20: "July", // "jul\0x20"
                                                                     0x6a756e20: "June", // "jun\0x20"
                                                                     0x6b706964: "kernelProcessId", // "kpid"
                                                                     0x6c697374: "list", // "list"
                                                                     0x696e736c: "locationReference", // "insl"
                                                                     0x6c667864: "longFixed", // "lfxd"
                                                                     0x6c667074: "longFixedPoint", // "lfpt"
                                                                     0x6c667263: "longFixedRectangle", // "lfrc"
                                                                     0x6c706e74: "longPoint", // "lpnt"
                                                                     0x6c726374: "longRectangle", // "lrct"
                                                                     0x6c6f6f70: "looping", // "loop"
                                                                     0x6d616368: "machine", // "mach"
                                                                     0x6d4c6f63: "machineLocation", // "mLoc"
                                                                     0x706f7274: "machPort", // "port"
                                                                     0x6d617220: "March", // "mar\0x20"
                                                                     0x6d617920: "May", // "may\0x20"
                                                                     0x6d6f6e20: "Monday", // "mon\0x20"
                                                                     0x6d637072: "movieCompressionPreset", // "mcpr"
                                                                     0x6d757465: "muted", // "mute"
                                                                     0x706e616d: "name", // "pnam"
                                                                     0x6e64696d: "naturalDimensions", // "ndim"
                                                                     0x6e6f2020: "no", // "no\0x20\0x20"
                                                                     0x6e6f7620: "November", // "nov\0x20"
                                                                     0x6e756c6c: "null", // "null"
                                                                     0x6e756d65: "numericStrings", // "nume"
                                                                     0x6f637420: "October", // "oct\0x20"
                                                                     0x50494354: "PICTPicture", // "PICT"
                                                                     0x74706d6d: "pixelMapRecord", // "tpmm"
                                                                     0x706c6179: "playing", // "play"
                                                                     0x51447074: "point", // "QDpt"
                                                                     0x70726573: "presenting", // "pres"
                                                                     0x70736e20: "processSerialNumber", // "psn\0x20"
                                                                     0x70414c4c: "properties", // "pALL"
                                                                     0x70726f70: "property_", // "prop"
                                                                     0x70756e63: "punctuation", // "punc"
                                                                     0x72617465: "rate", // "rate"
                                                                     0x7265636f: "record", // "reco"
                                                                     0x6f626a20: "reference", // "obj\0x20"
                                                                     0x74723136: "RGB16Color", // "tr16"
                                                                     0x74723936: "RGB96Color", // "tr96"
                                                                     0x63524742: "RGBColor", // "cRGB"
                                                                     0x74726f74: "rotation", // "trot"
                                                                     0x73617420: "Saturday", // "sat\0x20"
                                                                     0x73637072: "screenCompressionPreset", // "scpr"
                                                                     0x73637074: "script", // "scpt"
                                                                     0x73657020: "September", // "sep\0x20"
                                                                     0x73696e67: "shortFloat", // "sing"
                                                                     0x73686f72: "shortInteger", // "shor"
                                                                     0x54455854: "string", // "TEXT"
                                                                     0x7374796c: "styledClipboardText", // "styl"
                                                                     0x53545854: "styledText", // "STXT"
                                                                     0x73756e20: "Sunday", // "sun\0x20"
                                                                     0x74737479: "textStyleInfo", // "tsty"
                                                                     0x74687520: "Thursday", // "thu\0x20"
                                                                     0x54494646: "TIFFPicture", // "TIFF"
                                                                     0x74756520: "Tuesday", // "tue\0x20"
                                                                     0x74797065: "typeClass", // "type"
                                                                     0x75747874: "unicodeText", // "utxt"
                                                                     0x6d61676e: "unsignedInteger", // "magn"
                                                                     0x75743136: "utf16Text", // "ut16"
                                                                     0x75746638: "utf8Text", // "utf8"
                                                                     0x76657273: "version", // "vers"
                                                                     0x76646576: "videoRecordingDevice", // "vdev"
                                                                     0x77656420: "Wednesday", // "wed\0x20"
                                                                     0x77686974: "whitespace", // "whit"
                                                                     0x70736374: "writingCode", // "psct"
                                                                     0x79657320: "yes", // "yes\0x20"
                                                     ],
                                                     propertyNames: [
                                                                     0x766f6c75: "audioVolume", // "volu"
                                                                     0x70636c73: "class_", // "pcls"
                                                                     0x61707374: "currentAudioCompression", // "apst"
                                                                     0x63757276: "currentCamera", // "curv"
                                                                     0x63757261: "currentMicrophone", // "cura"
                                                                     0x6d707374: "currentMovieCompression", // "mpst"
                                                                     0x73707374: "currentScreenCompression", // "spst"
                                                                     0x74696d65: "currentTime", // "time"
                                                                     0x64647261: "dataRate", // "ddra"
                                                                     0x6473697a: "dataSize", // "dsiz"
                                                                     0x6475726e: "duration", // "durn"
                                                                     0x49442020: "id", // "ID\0x20\0x20"
                                                                     0x6c6f6f70: "looping", // "loop"
                                                                     0x6d757465: "muted", // "mute"
                                                                     0x706e616d: "name", // "pnam"
                                                                     0x6e64696d: "naturalDimensions", // "ndim"
                                                                     0x706c6179: "playing", // "play"
                                                                     0x70726573: "presenting", // "pres"
                                                                     0x70414c4c: "properties", // "pALL"
                                                                     0x72617465: "rate", // "rate"
                                                     ],
                                                     elementsNames: [
                                                                     0x61637072: "audioCompressionPresets", // "acpr"
                                                                     0x61646576: "audioRecordingDevices", // "adev"
                                                                     0x636f626a: "items", // "cobj"
                                                                     0x6d637072: "movieCompressionPresets", // "mcpr"
                                                                     0x73637072: "screenCompressionPresets", // "scpr"
                                                                     0x76646576: "videoRecordingDevices", // "vdev"
                                                     ])

private let _glueClasses = SwiftAutomation.GlueClasses(insertionSpecifierType: QTPInsertion.self,
                                       objectSpecifierType: QTPItem.self,
                                       multiObjectSpecifierType: QTPItems.self,
                                       rootSpecifierType: QTPRoot.self,
                                       applicationType: QuickTimePlayer.self,
                                       symbolType: QTPSymbol.self,
                                       formatter: _specifierFormatter)

private let _untargetedAppData = SwiftAutomation.AppData(glueClasses: _glueClasses)


/******************************************************************************/
// Symbol subclass defines static type/enum/property constants based on QuickTime Player.app terminology

public class QTPSymbol: SwiftAutomation.Symbol {

    override public var typeAliasName: String {return "QTP"}

    public override class func symbol(code: OSType, type: OSType = typeType, descriptor: NSAppleEventDescriptor? = nil) -> QTPSymbol {
        switch (code) {
        case 0x616c6973: return self.alias // "alis"
        case 0x2a2a2a2a: return self.anything // "****"
        case 0x62756e64: return self.applicationBundleId // "bund"
        case 0x7369676e: return self.applicationSignature // "sign"
        case 0x6170726c: return self.applicationUrl // "aprl"
        case 0x61707220: return self.April // "apr\0x20"
        case 0x61736b20: return self.ask // "ask\0x20"
        case 0x61637072: return self.audioCompressionPreset // "acpr"
        case 0x61646576: return self.audioRecordingDevice // "adev"
        case 0x766f6c75: return self.audioVolume // "volu"
        case 0x61756720: return self.August // "aug\0x20"
        case 0x62657374: return self.best // "best"
        case 0x626f6f6c: return self.boolean // "bool"
        case 0x71647274: return self.boundingRectangle // "qdrt"
        case 0x63617365: return self.case_ // "case"
        case 0x70636c73: return self.class_ // "pcls"
        case 0x636c7274: return self.colorTable // "clrt"
        case 0x61707374: return self.currentAudioCompression // "apst"
        case 0x63757276: return self.currentCamera // "curv"
        case 0x63757261: return self.currentMicrophone // "cura"
        case 0x6d707374: return self.currentMovieCompression // "mpst"
        case 0x73707374: return self.currentScreenCompression // "spst"
        case 0x74696d65: return self.currentTime // "time"
        case 0x74646173: return self.dashStyle // "tdas"
        case 0x74647461: return self.data // "tdta"
        case 0x64647261: return self.dataRate // "ddra"
        case 0x6473697a: return self.dataSize // "dsiz"
        case 0x6c647420: return self.date // "ldt\0x20"
        case 0x64656320: return self.December // "dec\0x20"
        case 0x6465636d: return self.decimalStruct // "decm"
        case 0x64696163: return self.diacriticals // "diac"
        case 0x636f6d70: return self.doubleInteger // "comp"
        case 0x6475726e: return self.duration // "durn"
        case 0x656e6373: return self.encodedString // "encs"
        case 0x656e756d: return self.enumerator // "enum"
        case 0x45505320: return self.EPSPicture // "EPS\0x20"
        case 0x65787061: return self.expansion // "expa"
        case 0x65787465: return self.extendedFloat // "exte"
        case 0x66656220: return self.February // "feb\0x20"
        case 0x66737266: return self.fileRef // "fsrf"
        case 0x66737320: return self.fileSpecification // "fss\0x20"
        case 0x6675726c: return self.fileUrl // "furl"
        case 0x66697864: return self.fixed // "fixd"
        case 0x66706e74: return self.fixedPoint // "fpnt"
        case 0x66726374: return self.fixedRectangle // "frct"
        case 0x646f7562: return self.float // "doub"
        case 0x6c64626c: return self.float128bit // "ldbl"
        case 0x66726920: return self.Friday // "fri\0x20"
        case 0x47494666: return self.GIFPicture // "GIFf"
        case 0x63677478: return self.graphicText // "cgtx"
        case 0x68797068: return self.hyphens // "hyph"
        case 0x49442020: return self.id // "ID\0x20\0x20"
        case 0x6c6f6e67: return self.integer // "long"
        case 0x69747874: return self.internationalText // "itxt"
        case 0x696e746c: return self.internationalWritingCode // "intl"
        case 0x636f626a: return self.item // "cobj"
        case 0x6a616e20: return self.January // "jan\0x20"
        case 0x4a504547: return self.JPEGPicture // "JPEG"
        case 0x6a756c20: return self.July // "jul\0x20"
        case 0x6a756e20: return self.June // "jun\0x20"
        case 0x6b706964: return self.kernelProcessId // "kpid"
        case 0x6c697374: return self.list // "list"
        case 0x696e736c: return self.locationReference // "insl"
        case 0x6c667864: return self.longFixed // "lfxd"
        case 0x6c667074: return self.longFixedPoint // "lfpt"
        case 0x6c667263: return self.longFixedRectangle // "lfrc"
        case 0x6c706e74: return self.longPoint // "lpnt"
        case 0x6c726374: return self.longRectangle // "lrct"
        case 0x6c6f6f70: return self.looping // "loop"
        case 0x6d616368: return self.machine // "mach"
        case 0x6d4c6f63: return self.machineLocation // "mLoc"
        case 0x706f7274: return self.machPort // "port"
        case 0x6d617220: return self.March // "mar\0x20"
        case 0x6d617920: return self.May // "may\0x20"
        case 0x6d6f6e20: return self.Monday // "mon\0x20"
        case 0x6d637072: return self.movieCompressionPreset // "mcpr"
        case 0x6d757465: return self.muted // "mute"
        case 0x706e616d: return self.name // "pnam"
        case 0x6e64696d: return self.naturalDimensions // "ndim"
        case 0x6e6f2020: return self.no // "no\0x20\0x20"
        case 0x6e6f7620: return self.November // "nov\0x20"
        case 0x6e756c6c: return self.null // "null"
        case 0x6e756d65: return self.numericStrings // "nume"
        case 0x6f637420: return self.October // "oct\0x20"
        case 0x50494354: return self.PICTPicture // "PICT"
        case 0x74706d6d: return self.pixelMapRecord // "tpmm"
        case 0x706c6179: return self.playing // "play"
        case 0x51447074: return self.point // "QDpt"
        case 0x70726573: return self.presenting // "pres"
        case 0x70736e20: return self.processSerialNumber // "psn\0x20"
        case 0x70414c4c: return self.properties // "pALL"
        case 0x70726f70: return self.property_ // "prop"
        case 0x70756e63: return self.punctuation // "punc"
        case 0x72617465: return self.rate // "rate"
        case 0x7265636f: return self.record // "reco"
        case 0x6f626a20: return self.reference // "obj\0x20"
        case 0x74723136: return self.RGB16Color // "tr16"
        case 0x74723936: return self.RGB96Color // "tr96"
        case 0x63524742: return self.RGBColor // "cRGB"
        case 0x74726f74: return self.rotation // "trot"
        case 0x73617420: return self.Saturday // "sat\0x20"
        case 0x73637072: return self.screenCompressionPreset // "scpr"
        case 0x73637074: return self.script // "scpt"
        case 0x73657020: return self.September // "sep\0x20"
        case 0x73696e67: return self.shortFloat // "sing"
        case 0x73686f72: return self.shortInteger // "shor"
        case 0x54455854: return self.string // "TEXT"
        case 0x7374796c: return self.styledClipboardText // "styl"
        case 0x53545854: return self.styledText // "STXT"
        case 0x73756e20: return self.Sunday // "sun\0x20"
        case 0x74737479: return self.textStyleInfo // "tsty"
        case 0x74687520: return self.Thursday // "thu\0x20"
        case 0x54494646: return self.TIFFPicture // "TIFF"
        case 0x74756520: return self.Tuesday // "tue\0x20"
        case 0x74797065: return self.typeClass // "type"
        case 0x75747874: return self.unicodeText // "utxt"
        case 0x6d61676e: return self.unsignedInteger // "magn"
        case 0x75743136: return self.utf16Text // "ut16"
        case 0x75746638: return self.utf8Text // "utf8"
        case 0x76657273: return self.version // "vers"
        case 0x76646576: return self.videoRecordingDevice // "vdev"
        case 0x77656420: return self.Wednesday // "wed\0x20"
        case 0x77686974: return self.whitespace // "whit"
        case 0x70736374: return self.writingCode // "psct"
        case 0x79657320: return self.yes // "yes\0x20"
        default: return super.symbol(code: code, type: type, descriptor: descriptor) as! QTPSymbol
        }
    }

    // Types/properties
    public static let alias = QTPSymbol(name: "alias", code: 0x616c6973, type: typeType) // "alis"
    public static let anything = QTPSymbol(name: "anything", code: 0x2a2a2a2a, type: typeType) // "****"
    public static let applicationBundleId = QTPSymbol(name: "applicationBundleId", code: 0x62756e64, type: typeType) // "bund"
    public static let applicationSignature = QTPSymbol(name: "applicationSignature", code: 0x7369676e, type: typeType) // "sign"
    public static let applicationUrl = QTPSymbol(name: "applicationUrl", code: 0x6170726c, type: typeType) // "aprl"
    public static let April = QTPSymbol(name: "April", code: 0x61707220, type: typeType) // "apr\0x20"
    public static let audioCompressionPreset = QTPSymbol(name: "audioCompressionPreset", code: 0x61637072, type: typeType) // "acpr"
    public static let audioRecordingDevice = QTPSymbol(name: "audioRecordingDevice", code: 0x61646576, type: typeType) // "adev"
    public static let audioVolume = QTPSymbol(name: "audioVolume", code: 0x766f6c75, type: typeType) // "volu"
    public static let August = QTPSymbol(name: "August", code: 0x61756720, type: typeType) // "aug\0x20"
    public static let best = QTPSymbol(name: "best", code: 0x62657374, type: typeType) // "best"
    public static let boolean = QTPSymbol(name: "boolean", code: 0x626f6f6c, type: typeType) // "bool"
    public static let boundingRectangle = QTPSymbol(name: "boundingRectangle", code: 0x71647274, type: typeType) // "qdrt"
    public static let class_ = QTPSymbol(name: "class_", code: 0x70636c73, type: typeType) // "pcls"
    public static let colorTable = QTPSymbol(name: "colorTable", code: 0x636c7274, type: typeType) // "clrt"
    public static let currentAudioCompression = QTPSymbol(name: "currentAudioCompression", code: 0x61707374, type: typeType) // "apst"
    public static let currentCamera = QTPSymbol(name: "currentCamera", code: 0x63757276, type: typeType) // "curv"
    public static let currentMicrophone = QTPSymbol(name: "currentMicrophone", code: 0x63757261, type: typeType) // "cura"
    public static let currentMovieCompression = QTPSymbol(name: "currentMovieCompression", code: 0x6d707374, type: typeType) // "mpst"
    public static let currentScreenCompression = QTPSymbol(name: "currentScreenCompression", code: 0x73707374, type: typeType) // "spst"
    public static let currentTime = QTPSymbol(name: "currentTime", code: 0x74696d65, type: typeType) // "time"
    public static let dashStyle = QTPSymbol(name: "dashStyle", code: 0x74646173, type: typeType) // "tdas"
    public static let data = QTPSymbol(name: "data", code: 0x74647461, type: typeType) // "tdta"
    public static let dataRate = QTPSymbol(name: "dataRate", code: 0x64647261, type: typeType) // "ddra"
    public static let dataSize = QTPSymbol(name: "dataSize", code: 0x6473697a, type: typeType) // "dsiz"
    public static let date = QTPSymbol(name: "date", code: 0x6c647420, type: typeType) // "ldt\0x20"
    public static let December = QTPSymbol(name: "December", code: 0x64656320, type: typeType) // "dec\0x20"
    public static let decimalStruct = QTPSymbol(name: "decimalStruct", code: 0x6465636d, type: typeType) // "decm"
    public static let doubleInteger = QTPSymbol(name: "doubleInteger", code: 0x636f6d70, type: typeType) // "comp"
    public static let duration = QTPSymbol(name: "duration", code: 0x6475726e, type: typeType) // "durn"
    public static let encodedString = QTPSymbol(name: "encodedString", code: 0x656e6373, type: typeType) // "encs"
    public static let enumerator = QTPSymbol(name: "enumerator", code: 0x656e756d, type: typeType) // "enum"
    public static let EPSPicture = QTPSymbol(name: "EPSPicture", code: 0x45505320, type: typeType) // "EPS\0x20"
    public static let extendedFloat = QTPSymbol(name: "extendedFloat", code: 0x65787465, type: typeType) // "exte"
    public static let February = QTPSymbol(name: "February", code: 0x66656220, type: typeType) // "feb\0x20"
    public static let fileRef = QTPSymbol(name: "fileRef", code: 0x66737266, type: typeType) // "fsrf"
    public static let fileSpecification = QTPSymbol(name: "fileSpecification", code: 0x66737320, type: typeType) // "fss\0x20"
    public static let fileUrl = QTPSymbol(name: "fileUrl", code: 0x6675726c, type: typeType) // "furl"
    public static let fixed = QTPSymbol(name: "fixed", code: 0x66697864, type: typeType) // "fixd"
    public static let fixedPoint = QTPSymbol(name: "fixedPoint", code: 0x66706e74, type: typeType) // "fpnt"
    public static let fixedRectangle = QTPSymbol(name: "fixedRectangle", code: 0x66726374, type: typeType) // "frct"
    public static let float = QTPSymbol(name: "float", code: 0x646f7562, type: typeType) // "doub"
    public static let float128bit = QTPSymbol(name: "float128bit", code: 0x6c64626c, type: typeType) // "ldbl"
    public static let Friday = QTPSymbol(name: "Friday", code: 0x66726920, type: typeType) // "fri\0x20"
    public static let GIFPicture = QTPSymbol(name: "GIFPicture", code: 0x47494666, type: typeType) // "GIFf"
    public static let graphicText = QTPSymbol(name: "graphicText", code: 0x63677478, type: typeType) // "cgtx"
    public static let id = QTPSymbol(name: "id", code: 0x49442020, type: typeType) // "ID\0x20\0x20"
    public static let integer = QTPSymbol(name: "integer", code: 0x6c6f6e67, type: typeType) // "long"
    public static let internationalText = QTPSymbol(name: "internationalText", code: 0x69747874, type: typeType) // "itxt"
    public static let internationalWritingCode = QTPSymbol(name: "internationalWritingCode", code: 0x696e746c, type: typeType) // "intl"
    public static let item = QTPSymbol(name: "item", code: 0x636f626a, type: typeType) // "cobj"
    public static let January = QTPSymbol(name: "January", code: 0x6a616e20, type: typeType) // "jan\0x20"
    public static let JPEGPicture = QTPSymbol(name: "JPEGPicture", code: 0x4a504547, type: typeType) // "JPEG"
    public static let July = QTPSymbol(name: "July", code: 0x6a756c20, type: typeType) // "jul\0x20"
    public static let June = QTPSymbol(name: "June", code: 0x6a756e20, type: typeType) // "jun\0x20"
    public static let kernelProcessId = QTPSymbol(name: "kernelProcessId", code: 0x6b706964, type: typeType) // "kpid"
    public static let list = QTPSymbol(name: "list", code: 0x6c697374, type: typeType) // "list"
    public static let locationReference = QTPSymbol(name: "locationReference", code: 0x696e736c, type: typeType) // "insl"
    public static let longFixed = QTPSymbol(name: "longFixed", code: 0x6c667864, type: typeType) // "lfxd"
    public static let longFixedPoint = QTPSymbol(name: "longFixedPoint", code: 0x6c667074, type: typeType) // "lfpt"
    public static let longFixedRectangle = QTPSymbol(name: "longFixedRectangle", code: 0x6c667263, type: typeType) // "lfrc"
    public static let longPoint = QTPSymbol(name: "longPoint", code: 0x6c706e74, type: typeType) // "lpnt"
    public static let longRectangle = QTPSymbol(name: "longRectangle", code: 0x6c726374, type: typeType) // "lrct"
    public static let looping = QTPSymbol(name: "looping", code: 0x6c6f6f70, type: typeType) // "loop"
    public static let machine = QTPSymbol(name: "machine", code: 0x6d616368, type: typeType) // "mach"
    public static let machineLocation = QTPSymbol(name: "machineLocation", code: 0x6d4c6f63, type: typeType) // "mLoc"
    public static let machPort = QTPSymbol(name: "machPort", code: 0x706f7274, type: typeType) // "port"
    public static let March = QTPSymbol(name: "March", code: 0x6d617220, type: typeType) // "mar\0x20"
    public static let May = QTPSymbol(name: "May", code: 0x6d617920, type: typeType) // "may\0x20"
    public static let Monday = QTPSymbol(name: "Monday", code: 0x6d6f6e20, type: typeType) // "mon\0x20"
    public static let movieCompressionPreset = QTPSymbol(name: "movieCompressionPreset", code: 0x6d637072, type: typeType) // "mcpr"
    public static let muted = QTPSymbol(name: "muted", code: 0x6d757465, type: typeType) // "mute"
    public static let name = QTPSymbol(name: "name", code: 0x706e616d, type: typeType) // "pnam"
    public static let naturalDimensions = QTPSymbol(name: "naturalDimensions", code: 0x6e64696d, type: typeType) // "ndim"
    public static let November = QTPSymbol(name: "November", code: 0x6e6f7620, type: typeType) // "nov\0x20"
    public static let null = QTPSymbol(name: "null", code: 0x6e756c6c, type: typeType) // "null"
    public static let October = QTPSymbol(name: "October", code: 0x6f637420, type: typeType) // "oct\0x20"
    public static let PICTPicture = QTPSymbol(name: "PICTPicture", code: 0x50494354, type: typeType) // "PICT"
    public static let pixelMapRecord = QTPSymbol(name: "pixelMapRecord", code: 0x74706d6d, type: typeType) // "tpmm"
    public static let playing = QTPSymbol(name: "playing", code: 0x706c6179, type: typeType) // "play"
    public static let point = QTPSymbol(name: "point", code: 0x51447074, type: typeType) // "QDpt"
    public static let presenting = QTPSymbol(name: "presenting", code: 0x70726573, type: typeType) // "pres"
    public static let processSerialNumber = QTPSymbol(name: "processSerialNumber", code: 0x70736e20, type: typeType) // "psn\0x20"
    public static let properties = QTPSymbol(name: "properties", code: 0x70414c4c, type: typeType) // "pALL"
    public static let property_ = QTPSymbol(name: "property_", code: 0x70726f70, type: typeType) // "prop"
    public static let rate = QTPSymbol(name: "rate", code: 0x72617465, type: typeType) // "rate"
    public static let record = QTPSymbol(name: "record", code: 0x7265636f, type: typeType) // "reco"
    public static let reference = QTPSymbol(name: "reference", code: 0x6f626a20, type: typeType) // "obj\0x20"
    public static let RGB16Color = QTPSymbol(name: "RGB16Color", code: 0x74723136, type: typeType) // "tr16"
    public static let RGB96Color = QTPSymbol(name: "RGB96Color", code: 0x74723936, type: typeType) // "tr96"
    public static let RGBColor = QTPSymbol(name: "RGBColor", code: 0x63524742, type: typeType) // "cRGB"
    public static let rotation = QTPSymbol(name: "rotation", code: 0x74726f74, type: typeType) // "trot"
    public static let Saturday = QTPSymbol(name: "Saturday", code: 0x73617420, type: typeType) // "sat\0x20"
    public static let screenCompressionPreset = QTPSymbol(name: "screenCompressionPreset", code: 0x73637072, type: typeType) // "scpr"
    public static let script = QTPSymbol(name: "script", code: 0x73637074, type: typeType) // "scpt"
    public static let September = QTPSymbol(name: "September", code: 0x73657020, type: typeType) // "sep\0x20"
    public static let shortFloat = QTPSymbol(name: "shortFloat", code: 0x73696e67, type: typeType) // "sing"
    public static let shortInteger = QTPSymbol(name: "shortInteger", code: 0x73686f72, type: typeType) // "shor"
    public static let string = QTPSymbol(name: "string", code: 0x54455854, type: typeType) // "TEXT"
    public static let styledClipboardText = QTPSymbol(name: "styledClipboardText", code: 0x7374796c, type: typeType) // "styl"
    public static let styledText = QTPSymbol(name: "styledText", code: 0x53545854, type: typeType) // "STXT"
    public static let Sunday = QTPSymbol(name: "Sunday", code: 0x73756e20, type: typeType) // "sun\0x20"
    public static let textStyleInfo = QTPSymbol(name: "textStyleInfo", code: 0x74737479, type: typeType) // "tsty"
    public static let Thursday = QTPSymbol(name: "Thursday", code: 0x74687520, type: typeType) // "thu\0x20"
    public static let TIFFPicture = QTPSymbol(name: "TIFFPicture", code: 0x54494646, type: typeType) // "TIFF"
    public static let Tuesday = QTPSymbol(name: "Tuesday", code: 0x74756520, type: typeType) // "tue\0x20"
    public static let typeClass = QTPSymbol(name: "typeClass", code: 0x74797065, type: typeType) // "type"
    public static let unicodeText = QTPSymbol(name: "unicodeText", code: 0x75747874, type: typeType) // "utxt"
    public static let unsignedInteger = QTPSymbol(name: "unsignedInteger", code: 0x6d61676e, type: typeType) // "magn"
    public static let utf16Text = QTPSymbol(name: "utf16Text", code: 0x75743136, type: typeType) // "ut16"
    public static let utf8Text = QTPSymbol(name: "utf8Text", code: 0x75746638, type: typeType) // "utf8"
    public static let version = QTPSymbol(name: "version", code: 0x76657273, type: typeType) // "vers"
    public static let videoRecordingDevice = QTPSymbol(name: "videoRecordingDevice", code: 0x76646576, type: typeType) // "vdev"
    public static let Wednesday = QTPSymbol(name: "Wednesday", code: 0x77656420, type: typeType) // "wed\0x20"
    public static let writingCode = QTPSymbol(name: "writingCode", code: 0x70736374, type: typeType) // "psct"

    // Enumerators
    public static let ask = QTPSymbol(name: "ask", code: 0x61736b20, type: typeEnumerated) // "ask\0x20"
    public static let case_ = QTPSymbol(name: "case_", code: 0x63617365, type: typeEnumerated) // "case"
    public static let diacriticals = QTPSymbol(name: "diacriticals", code: 0x64696163, type: typeEnumerated) // "diac"
    public static let expansion = QTPSymbol(name: "expansion", code: 0x65787061, type: typeEnumerated) // "expa"
    public static let hyphens = QTPSymbol(name: "hyphens", code: 0x68797068, type: typeEnumerated) // "hyph"
    public static let no = QTPSymbol(name: "no", code: 0x6e6f2020, type: typeEnumerated) // "no\0x20\0x20"
    public static let numericStrings = QTPSymbol(name: "numericStrings", code: 0x6e756d65, type: typeEnumerated) // "nume"
    public static let punctuation = QTPSymbol(name: "punctuation", code: 0x70756e63, type: typeEnumerated) // "punc"
    public static let whitespace = QTPSymbol(name: "whitespace", code: 0x77686974, type: typeEnumerated) // "whit"
    public static let yes = QTPSymbol(name: "yes", code: 0x79657320, type: typeEnumerated) // "yes\0x20"
}

public typealias QTP = QTPSymbol // allows symbols to be written as (e.g.) QTP.name instead of QTPSymbol.name


/******************************************************************************/
// Specifier extensions; these add command methods and property/elements getters based on QuickTime Player.app terminology

public protocol QTPCommand: SwiftAutomation.SpecifierProtocol {} // provides AE dispatch methods

// Command->Any will be bound when return type can't be inferred, else Command->T

extension QTPCommand {
    @discardableResult public func activate(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "activate", eventClass: 0x6d697363, eventID: 0x61637476, // "misc"/"actv"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func activate<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "activate", eventClass: 0x6d697363, eventID: 0x61637476, // "misc"/"actv"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func export(_ directParameter: Any = SwiftAutomation.NoParameter,
            in_: Any = SwiftAutomation.NoParameter,
            usingSettingsPreset: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "export", eventClass: 0x4d565752, eventID: 0x6578706f, // "MVWR"/"expo"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("in_", 0x6b66696c, in_), // "kfil"
                    ("usingSettingsPreset", 0x65787070, usingSettingsPreset), // "expp"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func export<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            in_: Any = SwiftAutomation.NoParameter,
            usingSettingsPreset: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "export", eventClass: 0x4d565752, eventID: 0x6578706f, // "MVWR"/"expo"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("in_", 0x6b66696c, in_), // "kfil"
                    ("usingSettingsPreset", 0x65787070, usingSettingsPreset), // "expp"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func get(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "get", eventClass: 0x636f7265, eventID: 0x67657464, // "core"/"getd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func get<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "get", eventClass: 0x636f7265, eventID: 0x67657464, // "core"/"getd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func newAudioRecording(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "newAudioRecording", eventClass: 0x4d565752, eventID: 0x6e776172, // "MVWR"/"nwar"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func newAudioRecording<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "newAudioRecording", eventClass: 0x4d565752, eventID: 0x6e776172, // "MVWR"/"nwar"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func newMovieRecording(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "newMovieRecording", eventClass: 0x4d565752, eventID: 0x6e617672, // "MVWR"/"navr"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func newMovieRecording<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "newMovieRecording", eventClass: 0x4d565752, eventID: 0x6e617672, // "MVWR"/"navr"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func newScreenRecording(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "newScreenRecording", eventClass: 0x4d565752, eventID: 0x6e736372, // "MVWR"/"nscr"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func newScreenRecording<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "newScreenRecording", eventClass: 0x4d565752, eventID: 0x6e736372, // "MVWR"/"nscr"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func open(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "open", eventClass: 0x61657674, eventID: 0x6f646f63, // "aevt"/"odoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func open<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "open", eventClass: 0x61657674, eventID: 0x6f646f63, // "aevt"/"odoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func openLocation(_ directParameter: Any = SwiftAutomation.NoParameter,
            window: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "openLocation", eventClass: 0x4755524c, eventID: 0x4755524c, // "GURL"/"GURL"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("window", 0x57494e44, window), // "WIND"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func openLocation<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            window: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "openLocation", eventClass: 0x4755524c, eventID: 0x4755524c, // "GURL"/"GURL"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("window", 0x57494e44, window), // "WIND"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func openURL(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "openURL", eventClass: 0x4755524c, eventID: 0x4755524c, // "GURL"/"GURL"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func openURL<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "openURL", eventClass: 0x4755524c, eventID: 0x4755524c, // "GURL"/"GURL"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func pause(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "pause", eventClass: 0x4d565752, eventID: 0x70617573, // "MVWR"/"paus"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func pause<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "pause", eventClass: 0x4d565752, eventID: 0x70617573, // "MVWR"/"paus"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func play(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "play", eventClass: 0x4d565752, eventID: 0x706c6179, // "MVWR"/"play"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func play<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "play", eventClass: 0x4d565752, eventID: 0x706c6179, // "MVWR"/"play"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func present(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "present", eventClass: 0x4d565752, eventID: 0x70726573, // "MVWR"/"pres"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func present<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "present", eventClass: 0x4d565752, eventID: 0x70726573, // "MVWR"/"pres"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func print(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "print", eventClass: 0x61657674, eventID: 0x70646f63, // "aevt"/"pdoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func print<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "print", eventClass: 0x61657674, eventID: 0x70646f63, // "aevt"/"pdoc"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func quit(_ directParameter: Any = SwiftAutomation.NoParameter,
            saving: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "quit", eventClass: 0x61657674, eventID: 0x71756974, // "aevt"/"quit"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("saving", 0x7361766f, saving), // "savo"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func quit<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            saving: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "quit", eventClass: 0x61657674, eventID: 0x71756974, // "aevt"/"quit"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("saving", 0x7361766f, saving), // "savo"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func reopen(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "reopen", eventClass: 0x61657674, eventID: 0x72617070, // "aevt"/"rapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func reopen<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "reopen", eventClass: 0x61657674, eventID: 0x72617070, // "aevt"/"rapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func resume(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "resume", eventClass: 0x4d565752, eventID: 0x72657375, // "MVWR"/"resu"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func resume<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "resume", eventClass: 0x4d565752, eventID: 0x72657375, // "MVWR"/"resu"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func run(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "run", eventClass: 0x61657674, eventID: 0x6f617070, // "aevt"/"oapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func run<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "run", eventClass: 0x61657674, eventID: 0x6f617070, // "aevt"/"oapp"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func set(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "set", eventClass: 0x636f7265, eventID: 0x73657464, // "core"/"setd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x64617461, to), // "data"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func set<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "set", eventClass: 0x636f7265, eventID: 0x73657464, // "core"/"setd"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("to", 0x64617461, to), // "data"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func showRemoteHud(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "showRemoteHud", eventClass: 0x4d565752, eventID: 0x726d6f74, // "MVWR"/"rmot"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func showRemoteHud<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "showRemoteHud", eventClass: 0x4d565752, eventID: 0x726d6f74, // "MVWR"/"rmot"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func start(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "start", eventClass: 0x4d565752, eventID: 0x73746172, // "MVWR"/"star"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func start<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "start", eventClass: 0x4d565752, eventID: 0x73746172, // "MVWR"/"star"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func stepBackward(_ directParameter: Any = SwiftAutomation.NoParameter,
            by: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "stepBackward", eventClass: 0x4d565752, eventID: 0x73746261, // "MVWR"/"stba"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("by", 0x73747063, by), // "stpc"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func stepBackward<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            by: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "stepBackward", eventClass: 0x4d565752, eventID: 0x73746261, // "MVWR"/"stba"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("by", 0x73747063, by), // "stpc"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func stepForward(_ directParameter: Any = SwiftAutomation.NoParameter,
            by: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "stepForward", eventClass: 0x4d565752, eventID: 0x7374666f, // "MVWR"/"stfo"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("by", 0x73747063, by), // "stpc"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func stepForward<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            by: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "stepForward", eventClass: 0x4d565752, eventID: 0x7374666f, // "MVWR"/"stfo"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("by", 0x73747063, by), // "stpc"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func stop(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "stop", eventClass: 0x4d565752, eventID: 0x73746f70, // "MVWR"/"stop"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func stop<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "stop", eventClass: 0x4d565752, eventID: 0x73746f70, // "MVWR"/"stop"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    @discardableResult public func trim(_ directParameter: Any = SwiftAutomation.NoParameter,
            from: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> Any {
        return try self.appData.sendAppleEvent(name: "trim", eventClass: 0x4d565752, eventID: 0x7472696d, // "MVWR"/"trim"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("from", 0x7472666d, from), // "trfm"
                    ("to", 0x7472746f, to), // "trto"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
    public func trim<T>(_ directParameter: Any = SwiftAutomation.NoParameter,
            from: Any = SwiftAutomation.NoParameter,
            to: Any = SwiftAutomation.NoParameter,
            resultType: SwiftAutomation.Symbol? = nil, waitReply: Bool = true, sendOptions: SwiftAutomation.SendOptions? = nil,
            withTimeout: TimeInterval? = nil, considering: SwiftAutomation.ConsideringOptions? = nil) throws -> T {
        return try self.appData.sendAppleEvent(name: "trim", eventClass: 0x4d565752, eventID: 0x7472696d, // "MVWR"/"trim"
                parentSpecifier: (self as! SwiftAutomation.Specifier), directParameter: directParameter, keywordParameters: [
                    ("from", 0x7472666d, from), // "trfm"
                    ("to", 0x7472746f, to), // "trto"
                ], requestedType: resultType, waitReply: waitReply, sendOptions: sendOptions,
                withTimeout: withTimeout, considering: considering)
    }
}


public protocol QTPObject: SwiftAutomation.ObjectSpecifierExtension, QTPCommand {} // provides vars and methods for constructing specifiers

extension QTPObject {
    
    // Properties
    public var audioVolume: QTPItem {return self.property(0x766f6c75) as! QTPItem} // "volu"
    public var class_: QTPItem {return self.property(0x70636c73) as! QTPItem} // "pcls"
    public var currentAudioCompression: QTPItem {return self.property(0x61707374) as! QTPItem} // "apst"
    public var currentCamera: QTPItem {return self.property(0x63757276) as! QTPItem} // "curv"
    public var currentMicrophone: QTPItem {return self.property(0x63757261) as! QTPItem} // "cura"
    public var currentMovieCompression: QTPItem {return self.property(0x6d707374) as! QTPItem} // "mpst"
    public var currentScreenCompression: QTPItem {return self.property(0x73707374) as! QTPItem} // "spst"
    public var currentTime: QTPItem {return self.property(0x74696d65) as! QTPItem} // "time"
    public var dataRate: QTPItem {return self.property(0x64647261) as! QTPItem} // "ddra"
    public var dataSize: QTPItem {return self.property(0x6473697a) as! QTPItem} // "dsiz"
    public var duration: QTPItem {return self.property(0x6475726e) as! QTPItem} // "durn"
    public var id: QTPItem {return self.property(0x49442020) as! QTPItem} // "ID\0x20\0x20"
    public var looping: QTPItem {return self.property(0x6c6f6f70) as! QTPItem} // "loop"
    public var muted: QTPItem {return self.property(0x6d757465) as! QTPItem} // "mute"
    public var name: QTPItem {return self.property(0x706e616d) as! QTPItem} // "pnam"
    public var naturalDimensions: QTPItem {return self.property(0x6e64696d) as! QTPItem} // "ndim"
    public var playing: QTPItem {return self.property(0x706c6179) as! QTPItem} // "play"
    public var presenting: QTPItem {return self.property(0x70726573) as! QTPItem} // "pres"
    public var properties: QTPItem {return self.property(0x70414c4c) as! QTPItem} // "pALL"
    public var rate: QTPItem {return self.property(0x72617465) as! QTPItem} // "rate"

    // Elements
    public var audioCompressionPresets: QTPItems {return self.elements(0x61637072) as! QTPItems} // "acpr"
    public var audioRecordingDevices: QTPItems {return self.elements(0x61646576) as! QTPItems} // "adev"
    public var items: QTPItems {return self.elements(0x636f626a) as! QTPItems} // "cobj"
    public var movieCompressionPresets: QTPItems {return self.elements(0x6d637072) as! QTPItems} // "mcpr"
    public var screenCompressionPresets: QTPItems {return self.elements(0x73637072) as! QTPItems} // "scpr"
    public var videoRecordingDevices: QTPItems {return self.elements(0x76646576) as! QTPItems} // "vdev"
}


/******************************************************************************/
// Specifier subclasses add app-specific extensions

// beginning/end/before/after
public class QTPInsertion: SwiftAutomation.InsertionSpecifier, QTPCommand {}


// property/by-index/by-name/by-id/previous/next/first/middle/last/any
public class QTPItem: SwiftAutomation.ObjectSpecifier, QTPObject {
    public typealias InsertionSpecifierType = QTPInsertion
    public typealias ObjectSpecifierType = QTPItem
    public typealias MultipleObjectSpecifierType = QTPItems
}

// by-range/by-test/all
public class QTPItems: QTPItem, SwiftAutomation.ElementsSpecifierExtension {}

// App/Con/Its
public class QTPRoot: SwiftAutomation.RootSpecifier, QTPObject, SwiftAutomation.RootSpecifierExtension {
    public typealias InsertionSpecifierType = QTPInsertion
    public typealias ObjectSpecifierType = QTPItem
    public typealias MultipleObjectSpecifierType = QTPItems
    public override class var untargetedAppData: SwiftAutomation.AppData { return _untargetedAppData }
}

// Application
public class QuickTimePlayer: QTPRoot, SwiftAutomation.Application {
    public convenience init(launchOptions: SwiftAutomation.LaunchOptions = SwiftAutomation.DefaultLaunchOptions, relaunchMode: SwiftAutomation.RelaunchMode = SwiftAutomation.DefaultRelaunchMode) {
        self.init(rootObject: SwiftAutomation.AppRootDesc, appData: type(of:self).untargetedAppData.targetedCopy(
                  .bundleIdentifier("com.apple.QuickTimePlayerX", true), launchOptions: launchOptions, relaunchMode: relaunchMode))
    }
}

// App/Con/Its root objects used to construct untargeted specifiers; these can be used to construct specifiers for use in commands, though cannot send commands themselves

public let QTPApp = _untargetedAppData.app as! QTPRoot
public let QTPCon = _untargetedAppData.con as! QTPRoot
public let QTPIts = _untargetedAppData.its as! QTPRoot


/******************************************************************************/
// Static types

public typealias QTPRecord = [QTPSymbol:Any] // default Swift type for AERecordDescs







