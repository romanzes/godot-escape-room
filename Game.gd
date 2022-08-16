extends Node2D

var clockPickedUp: bool = false
var picturePickedUp: bool = false
var vasePickedUp: bool = false
var wrenchPickedUp: bool = false

enum DoorState { CLOSED, SEMI_OPEN, OPEN }
var doorState = DoorState.CLOSED
