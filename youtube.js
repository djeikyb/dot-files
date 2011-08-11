$(document).ready(function() {
	// check for youtube detected song
	detected_song = $('.watch-extra-info-left');
	if(detected_song.length)
	{
		artist_name = detected_song.find('a strong').text();
		
		// use standard JS DOM access because jQuery does not see the text node
		song_name = detected_song[0].childNodes[2].data;
		
		// clean song_name, need to trim it and remove the trailing dash
		song_name = song_name.substring(3).trim()
		
		/*console.log(artist_name);
		console.log(song_name);*/
		
		settings = false;
		// TODO: add event handler to make the scrobble automatic
		
		chrome.extension.sendRequest(
			{
				name: "scrobble",
				artist: artist_name,
				song: song_name
			},
			function(response) {}
		);
	}
});
