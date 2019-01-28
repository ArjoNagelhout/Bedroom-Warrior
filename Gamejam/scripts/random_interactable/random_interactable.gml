var pool = array_length_1d(global.interactables)-1
var index = round(random(pool))
global.interactables[index].current_state = INTERACTABLE_STATES.scary
global.current_event_interactable = global.interactables[index]