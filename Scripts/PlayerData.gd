extends Node2D

var save_path = "user://save_temp.dat"

var pdata = {
		"name" : "Mama",
		"Score" : 20
		}

func save_data(var dt = null, var pt = ""):
	var file = File.new()
	var error = file.open(pt, File.WRITE)
	if error == OK:
		file.store_var(dt)
		file.close()

func load_data(var dt = null, var pt = ""):
	var file = File.new()
	var p_data = null
	if file.file_exists(pt):
		var error = file.open(pt, File.READ)
		print(error)
		if error == OK:
			p_data = file.get_var()
			file.close()
	return p_data
