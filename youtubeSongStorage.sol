//SPDX-License-Identifier: MIT
pragma solidity ^0.8.18; //solidity version 0.8.18 or above

contract SimpleStorage {

    struct songEntry {
        string title;
        string URL;
    }
    
    songEntry songOfTheDay = songEntry("",""); 

    songEntry[] public songPlaylist; //defaults to []

    mapping(string => string) public songTitleToURL;

    function addFeaturedSong(string memory _title, string memory _URL) public {
        songOfTheDay = songEntry(_title,_URL); //sends a transaction to the blockchain
    }

    function getFeaturedSong () public view returns (songEntry memory) { 
        return songOfTheDay;
    } 

    function addToPlaylist(string memory _title, string memory _URL) public {
        songPlaylist.push(songEntry(_title, _URL));
        songTitleToURL[_title] = _URL;
    }
}

