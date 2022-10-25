extends Control
#fecth data from the API and then display it in the game.

func _ready():
	$HTTPRequest.connect("request_completed", self, "_on_request_completed")

func _on_fetchbtn_pressed():
	#now to request data from an API
	#note I will be using '..' API
	$HTTPRequest.request("http://www.mocky.io/v2/5185415ba171ea3a00704eed")
	
func _on_request_completed(result, response_code, headers, body):
	var json = JSON.parse(body.get_string_from_utf8())
	print(json.result)
	#display in game
	$Panel/output.text = json.result['hello']
