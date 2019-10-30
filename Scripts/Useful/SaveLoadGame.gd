extends Node

const SaveGame = preload("res://Scripts/SaveGame.gd")
var SAVE_FOLDER = "res://Save"
var SAVE_NAME_TEMPLATE = "save_%03d.tres"

func save(file_name):
	var save_game = SaveGame.new()
	save_game.game_version = ProjectSettings.get_setting("application/config/version")
	for node in get_tree().get_nodes_in_group("save"):
		node.save(save_game)
	
	var directory = Directory.new()
	if not directory.dir_exists(SAVE_FOLDER):
		directory.make_dir_recursive(SAVE_FOLDER)
	
	var save_path = SAVE_FOLDER.plus_file(SAVE_NAME_TEMPLATE % file_name)
	var error = ResourceSaver.save(save_path, save_game)
	if error != OK:
		print('There was an issue writing the save %s to %s' % [file_name, save_path])

func load(file_name):
	var save_file_path = SAVE_FOLDER.plus_file(SAVE_NAME_TEMPLATE % file_name)
	var file = File.new()
	if not file.file_exists(save_file_path):
		print("Save file %s doesn't exist" % save_file_path)
		return

	var save_game = load(save_file_path)
	for node in get_tree().get_nodes_in_group("save"):
		node.load(save_game)