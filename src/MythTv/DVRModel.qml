import QtQuick 2.0
//import QtWebKit 3.0
import QtQuick.XmlListModel 2.0
import QtQuick.LocalStorage 2.0
import "dbUtil.js" as DataBase
import "Util.js" as Util

//Models to make for GETS
//CONTENT
//http://ubuntu:6544/Content/GetLiveStreamList

////MYTH API

//     http://ubuntu:6544/Myth/GetTimeZone
//http://192.168.1.21:6544/Myth/GetConnectionInfo   ///DONE
//http://192.168.1.21:6544/Myth/GetStorageGroupDirs
//http://192.168.1.21:6544/Myth/GetHostName
//http://192.168.1.21:6544/Myth/GetHosts
//http://192.168.1.21:6544/Myth/GetKeys /// later not now
//http://192.168.1.21:6544/Myth/GetLogs
//http://192.168.1.21:6544/Myth/GetSetting ////BROKEN


///    Capture Card
//http://192.168.1.21:6544/Capture/GetCaptureCardList

//Channels


//http://192.168.1.21:6544/Channel/FetchChannelsFromSource       A source ID and card ID are both required

//CONTENT
//http://192.168.1.21:6544/Content/GetRecordingArtwork    Needs to have a FileName

//DVR
//http://192.168.1.21:6544/Dvr/GetConflictList
//http://192.168.1.21:6544/Dvr/GetUpcomingList


//Video
//http://192.168.1.21:6544/Video/GetBluray
//http://192.168.1.21:6544/Video/LookupVideo requirs a lot







XmlListModel{
    id: videoNfo
    source: DataBase.ipAddress()+":"+DataBase.port()+Util.getAllVideos
    query: "/VideoMetadataInfoList/VideoMetadataInfos/VideoMetadataInfo"
    XmlRole { name: "id"; query: "Id/string()" }
    XmlRole { name: "title"; query: "Title/string()" }
    XmlRole { name: "SubTitle"; query: "SubTitle/string()" }
    XmlRole { name: "Tagline"; query: "Tagline/string()" }
    XmlRole { name: "Director"; query: "Director/string()" }
    XmlRole { name: "Studio"; query: "Studio/string()" }
    XmlRole { name: "Description"; query: "Description/string()" }
    XmlRole { name: "Collectionref"; query: "Collectionref/string()" }
    XmlRole { name: "HomePage"; query: "HomePage/string()" }
    XmlRole { name: "ReleaseDate"; query: "ReleaseDate/string()" }
    XmlRole { name: "AddDate"; query: "AddDate/string()" }
    XmlRole { name: "UserRating"; query: "UserRating/string()" }
    XmlRole { name: "Length"; query: "Length/string()" }
    XmlRole { name: "PlayCount"; query: "PlayCount/string()" }
    XmlRole { name: "Season"; query: "Season/string()" }
    XmlRole { name: "Episode"; query: "Episode/string()" }
    XmlRole { name: "ParentalLevel"; query: "ParentalLevel/string()" }
    XmlRole { name: "Visible"; query: "Visible/string()" }
    XmlRole { name: "Watched"; query: "Watched/string()" }
    XmlRole { name: "Processed"; query: "Processed/string()" }
    XmlRole { name: "ContentType"; query: "ContentType/string()" }
    XmlRole { name: "FileName"; query: "FileName/string()" }
    XmlRole { name: "Hash"; query: "Hash/string()" }
    XmlRole { name: "HostName"; query: "HostName/string()" }
    XmlRole { name: "Coverart"; query: "Coverart/string()" }
    XmlRole { name: "Fanart"; query: "Fanart/string()" }
    XmlRole { name: "Banner"; query: "Banner/string()" }
    XmlRole { name: "Screenshot"; query: "Screenshot/string()" }
    XmlRole { name: "Trailer"; query: "Trailer/string()" }
    onStatusChanged: {
        if (status == XmlListModel.Ready){
            buyfferIndicator.visible = false
            buyfferIndicator.running = false
        }
        if (status === XmlListModel.Loading) {
            buyfferIndicator.visable = true
            buyfferIndicator.running = true
            console.log("LOADING>>>>>>>")
        }
        if (status === XmlListModel.Error){

            console.log("Error: " + errorString + "\n \n \n " + videoNfo.source.toString());
        }
    }
}
