players = 11

meters = 500
metersside.text = meters+"m"

#REAL TIME
days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November', 'December']


datex = []
setTime = () ->
	date = new Date
	datex[0] = date.getTime() #UNIX SECONDS
	datex[1] = date.getSeconds() #SECONDS
	datex[2] = date.getMinutes() #MINUTES
	datex[3] = date.getHours() #HOURS
	datex[4] = date.getDate() #DAY IN MONTH
	datex[5] = date.getDay() #DAY IN WEEK
	datex[6] = date.getMonth() #Month
	dated = datex
	for i in [1..3]
		if dated[i] < 10
			dated[i] = '0' + dated[i] 

	current_date_time.text = "#{dated[3]}:#{dated[2]}:#{dated[1]} " + days[datex[5]] + ", " + months[datex[6]] + " " + datex[4] 
	Utils.delay 1, ->
		setTime()
		
setTime()

#DATA info_horse[data][horse]
i_place = [0,0,0,0,0,0,0,0,0,0,0,0] #0
i_number = [11, 27, 65, 52, 23, 41, 67, 90, 1, 9, 69, 6] #1
i_type = ["Z1", "Z2", "Z771", "Z110", "Z901","Z91","Z97","Z45","Z4","Z123","Z290","Z290"] #2
i_name = ["Mary", "Steve", "Super Mike", "Jane", "Sue","George","Big Mac","Fioletta","Daisy","Party Night Cancan","Little Star","Asuka"] #3
i_color = ["#73D9A3","#9CC1E3","#F6B5B5","#B3A6DF","#DEEB60","#E2C69B","#935C88","#D97C73","#73ABD9","#B88C8E","#B5E49D","#4F76FF"] #4
horses = []
horses_positions = []
horses_speeds = []
horses_placements = []


info_horse = [i_place, i_number, i_type, i_name, i_color, horses, horses_positions, horses_speeds]


# gating = [horse_gate_1,]

#LIST CODE
listings = []
for line in [0..players]
	listing = new Layer
		width: player_list.width
		height: 12
		y: (6+12)*line
		parent: player_list
		backgroundColor: "rgba(123,123,123,0)"
		listings.push(listing)
	positioning = new TextLayer
		fontSize: 7
		fontWeight: 800
		text: info_horse[0][line]+"th"
		textAlign: "center"
		padding:
			top: 2
		width: 24
		height: 12
		borderRadius: 100
		parent: listing
	numbering = new TextLayer
		size: 12
		text: info_horse[1][line]
		fontSize: 7
		fontWeight: 800
		padding:
			top: 2
		textAlign: "center"
		color: "white"
		backgroundColor: info_horse[4][line]
		x: positioning.maxX + 4
		borderRadius: 100
		parent: listing
	typeing = new TextLayer
		x: numbering.maxX + 4
		text: info_horse[2][line]
		padding:
			top: 2
		fontSize: 7
		parent: listing
	nameing = new TextLayer
		x: numbering.maxX + 28
		color: "white"
		text: info_horse[3][line]
		padding:
			top: 2
		fontSize: 7
		parent: listing

distance = new Layer
	parent: ridefield
	maxY: ridefield.maxY-36-100
	height: meters
	width: ridefield.width
hundreds = meters/100
for a in [1..hundreds]
	horizontal_line = new Layer
		y: 100*a
		height: 1
		width: Screen.width
		backgroundColor: "rgba(255,255,255,0.5)"
		parent: distance


horse_speed_base = 16.66
csf = horse_speed_base * 0.15


# for i in [0..players]
# 	.backgroundColor = info_horse[4][i]

for i in [0..players]
	horse = new Layer
		parent: distance
		size: 8
		backgroundColor: info_horse[4][i]
		y: distance.maxY-40
		x: distance.width*0.0647+(distance.width-(distance.width*0.14))/players*i
		borderRadius: 100
		borderWidth: 1
		name: "Horse"+(i+1)
		borderColor: "rgba(0,0,0,1)"
	horses.push(horse)
	horse_position = 0
	horses_positions.push(horse_position)
	horse_speed = horse_speed_base
	horses_speeds.push(horse_speed)
# 	horse.on "change:y", ->
# 		if Utils.round(this.y, 0) == 470
# 			for a in [0..players]
# 				print player_list[i]
# 		if Utils.round(this.y, 0) == 370
# 			print horse.y
# 		if Utils.round(this.y, 0) == 270
# 			print horse.y
# 		if Utils.round(this.y, 0) == 170
# 			print horse.y


#RACE
race = true
finished = false
crit=0
distance_left = distance.height


start_time = datex[0]
Utils.interval 1, ->
	if race == true
		now_time = datex[0]
		delta = Math.abs(now_time - start_time) / 1000;
		for i in [0..players]
			if 13 < horses_speeds[i] < 19
				horses_speeds[i] = horses_speeds[i] + Utils.randomNumber(-csf, csf)
			else if horses_speeds[i] > 19
				horses_speeds[i] = horses_speeds[i] - 1
			else if horses_speeds[i] < 13
				horses_speeds[i] = horses_speeds[i] + 1
			horses_positions[i] = horses_positions[i] + horses_speeds[i]
			horses[i].animate
				y: distance.height-horses_positions[i]
				options:
					time: 2
					curve: Bezier.easeOut


#RACE OLD
# race = true
# finished = false
# last_horse = 0
# crit=0
# distance_left = distance.height
# 
# Utils.interval Utils.randomNumber(2, 7), ->
# 	if race == true
# 		for i in [0...players]
# 			horses_speeds[i] = horse_speed_base + Utils.randomNumber(-1, 1)
# 
# Utils.delay 0.1, ->
# 	start_time = datex[0]
# 	Utils.interval 1/2, ->
# 		if race == true
# 			for i in [0..players]
# 				if horses[i].y > 10
# 					horses_speeds[i] = horses_speeds[i] + Utils.randomNumber(-csf, csf)
# 					horses_positions[i] = horses_positions[i] + horses_speeds[i]/2
# 					horses[i].animate
# 						y: distance.height-horses_positions[i]
# 						options:
# 							time: 1
# 							curve: Bezier.easeOut
# 			#FINISH THE RACE
# 			if horses_placements[0] > meters
# 				race = false
# 				finish_time = datex[0]
# 				dur_time = finish_time - start_time 
