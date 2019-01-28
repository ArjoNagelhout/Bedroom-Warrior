var i
var a = 0;
for (i = 0; i < instance_number(obj_interactable); i += 1) {
	var new_instance = instance_find(obj_interactable,i)
	if (new_instance.boss == false) {
		global.interactables[a] = new_instance
		a += 1;
	}
}