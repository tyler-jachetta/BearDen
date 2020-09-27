class bearden::regolith($status_bar_packages=[
	"i3xrocks-battery",  "i3xrocks-time",  "i3xrocks-wifi",  "i3xrocks-media-player",  "i3xrocks-volume",]) {

	package{$status_bar_packages:
		ensure	=> installed,
	}



}