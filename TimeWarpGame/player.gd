extends KinematicBody2D

# This demo shows how to build a kinematic controller.

# Member variables
const GRAVITY = 500.0 # pixels/second/second

# Angle in degrees towards either side that the player can consider "floor"
const FLOOR_ANGLE_TOLERANCE = 40
const WALK_FORCE = 600
const WALK_MIN_SPEED = 10
const WALK_MAX_SPEED = 200
const STOP_FORCE = 1300
const JUMP_SPEED = 200
const JUMP_MAX_AIRBORNE_TIME = 0.2

const SLIDE_STOP_VELOCITY = 1.0 # one pixel/second
const SLIDE_STOP_MIN_TRAVEL = 1.0 # one pixel

var velocity = Vector2()
var on_air_time = 100
var jumping = false

var prev_jump_pressed = false

var time_start = 0
var time_now = 0
var elapsed = 0

var Ghost = {
    pos = [],
    time = []
    }

var loopcount = 0

func _ready():
    time_start = OS.get_ticks_msec()
    set_process(true)

func _process(delta):
    time_now = OS.get_ticks_msec()
    var elapsed = time_now - time_start
    #print("elapsed : ", elapsed)
    #print(self.get_path())

func _reset():
    loopcount = 1
    var f = Vector2(72.1,440.8)
    position = f
    
    
func _physics_process(delta):
    # Create forces
    var force = Vector2(0, GRAVITY)

    var walk_left = Input.is_action_pressed("move_left")
    var walk_right = Input.is_action_pressed("move_right")
    var jump = Input.is_action_pressed("jump")
    
    if Input.is_key_pressed(KEY_R):
        self._reset()
        


    
    if (elapsed % 1000 == 0):
        if (loopcount == 0):
            Ghost.pos.append(get_position())
            Ghost.time = elapsed
        
    
    var stop = true
    
    if walk_left:
        if velocity.x <= WALK_MIN_SPEED and velocity.x > -WALK_MAX_SPEED:
            
            force.x -= WALK_FORCE
            stop = false
          
        get_node( "Sprite" ).set_flip_h( true )
    elif walk_right:
        if velocity.x >= -WALK_MIN_SPEED and velocity.x < WALK_MAX_SPEED:
          
            force.x += WALK_FORCE
            stop = false
        get_node( "Sprite" ).set_flip_h( false )
    if stop:
        var vsign = sign(velocity.x)
        var vlen = abs(velocity.x)
        
        vlen -= STOP_FORCE * delta
        if vlen < 0:
            vlen = 0
        
        velocity.x = vlen * vsign
        #TODO: this should probably change back to
        #idle sprite instead of just stopping animation.
       
    # Integrate forces to velocity
    velocity += force * delta	
    # Integrate velocity into motion and move
    velocity = move_and_slide(velocity, Vector2(0, -1))
    
    if is_on_floor():
        on_air_time = 0
        
    if jumping and velocity.y > 0:
        # If falling, no longer jumping
        jumping = false
    
    if on_air_time < JUMP_MAX_AIRBORNE_TIME and jump and not prev_jump_pressed and not jumping:
        # Jump must also be allowed to happen if the character left the floor a little bit ago.
        # Makes controls more snappy.
        velocity.y = -JUMP_SPEED
        jumping = true
    #animation controls
    if (velocity.length() > 0):
         if not get_node('AnimationPlayer').is_playing():
             get_node('AnimationPlayer').play()
    else:
         get_node('AnimationPlayer').stop()
    on_air_time += delta
    prev_jump_pressed = jump
