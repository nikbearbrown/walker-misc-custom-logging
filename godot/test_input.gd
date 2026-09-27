extends SceneTree

var checks := 0
var failures := 0

func _initialize() -> void:
	call_deferred("run")

func check(ok: bool, label: String) -> void:
	checks += 1
	if not ok:
		failures += 1
	print("PASS " if ok else "FAIL ", label)

func run() -> void:
	root.size = Vector2i(1920, 1080)
	var demo: Control = load("res://main.tscn").instantiate()
	root.add_child(demo)
	await process_frame
	await process_frame
	var console: RichTextLabel = root.get_node("CustomLoggerUI/Panel/RichTextLabel")
	for token in ["Normal message 1.", "Error 1.", "Warning 1.", "Normal message 1 (stderr).", "Normal message 1 (raw)."]:
		check(console.get_parsed_text().contains(token), "initial console contains " + token)
	var actions := [
		["PrintMessage", "message_counter", "Printing message #1."],
		["PrintMessageRaw", "message_raw_counter", "Printing message #1 (raw)."],
		["PrintMessageStderr", "message_stderr_counter", "Printing message #1 (stderr)."],
		["PrintWarning", "warning_counter", "Printing warning #1."],
		["PrintError", "error_counter", "Printing error #1."]]
	for action in actions:
		var button: Button = demo.get_node("Actions/" + action[0])
		for down in [true, false]:
			var event := InputEventMouseButton.new()
			event.position = button.get_global_rect().get_center()
			event.global_position = event.position
			event.button_index = MOUSE_BUTTON_LEFT
			event.pressed = down
			root.push_input(event, true)
			await process_frame
		await process_frame
		check(demo.get(action[1]) == 1, action[0] + " increments counter")
		check(console.get_parsed_text().contains(action[2]), action[0] + " reaches in-game console")
	print("RESULT checks=", checks, " failures=", failures, "; expected demo errors/warnings are intentional")
	await process_frame
	quit(1 if failures else 0)
