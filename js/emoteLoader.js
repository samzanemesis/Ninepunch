var emotes;

function manifestCallback(){
    console.log( "Ratings are" + window.ratings );
}

function loadEmotes(){
    emotes = Qt.include( "http://forum.facepunch.com/manifest", console.log("finished") );
    console.log("loading emotes" + emotes.status);
}

