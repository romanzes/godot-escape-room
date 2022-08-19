extends Node2D

onready var inventory = get_node("/root/Node2D/Inventory/InventoryList")

var clockPickedUp: bool = false
var picturePickedUp: bool = false
var vasePickedUp: bool = false
var wrenchPickedUp: bool = false

enum DoorState { LOCKED, CLOSED, SEMI_OPEN, OPEN }
var doorState = DoorState.LOCKED
