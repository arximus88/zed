#INPUT START DATA
racelength = 400
scalefactor = 4
numberofplayers = 12
playerChoice = 4

montserrat  = Utils.loadWebFont("Montserrat")

currentPlayer = playerChoice-1
players = numberofplayers-1
meters = racelength*scalefactor
metersside.text = racelength + "m"

distance.height = meters
bar1.parent = distance
bar1.maxY=distance.height+100
topbar.bringToFront()
bar2.bringToFront()
if Screen.width > 1640
	bar1.width = 1640-sidebar.width
if Screen.width < 1000
	sidebar.width = 360
	ridefield.x = sidebar.width
	ridefield.width = Screen.width-sidebar.width
	bar1.width = Screen.width-sidebar.width
horse_speed_base = 16.66*scalefactor
csf = horse_speed_base * 0.15

hundreds = racelength / 100

#REAL TIME
days = ['Sunday', 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday']
months = ['January', 'February', 'March', 'April', 'May', 'June', 'July', 'August', 'September', 'October', 'November',
  'December']

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
  datex[7] = date.getMilliseconds()/10
  dated = datex
  for i in [1..3]
    if dated[i] < 10
      dated[i] = '0' + dated[i]

  Utils.delay 0.1, ->
    setTime()

setTime()
#CURRENT DATE
current_date_time.text = days[datex[5]] + ", " + months[datex[6]] + " " + datex[4]
#SET DATA 
# info_horse[data][horse]
i_place = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] #0
i_number = [11, 27, 65, 52, 23, 41, 67, 90, 1, 9, 69, 6] #1
i_type = ["Z1", "Z2", "Z771", "Z110", "Z901", "Z91", "Z97", "Z45", "Z4", "Z123", "Z290", "Z290"] #2
i_name = ["Mary", "Steve", "Pinkie Pie", "Twilnight Sparkle", "Sue", "George", "Big Mac", "Fioletta", "Rainbow Dash", "Party Night Cancan",
  "Little Star", "Asuka"] #3
i_color = ["#73D9A3", "#9CC1E3", "#F6B5B5", "#B3A6DF", "#CDDA61", "#AB987C", "#935C88", "#D97C73", "#73ABD9", "#B88C8E",
  "#9DCD84", "#4F76FF"] #4
horses = [horse1,horse2,horse3,horse4,horse5,horse6,horse7,horse8,horse9,horse10,horse11,horse12]
horses_positions = []
horses_speeds = []
horses_placements = []
i_gate = ["G1","G2","G3","G4","G5","G6","G7","G8","G9","G10","G11","G12",]
info_horse = [i_place, i_number, i_type, i_name, i_color, horses, horses_positions, horses_speeds, i_gate]


opacity_a = 0.25
a_color = ["rgba(115, 217, 163," +opacity_a+")","rgba(156, 193, 227," +opacity_a+")","rgba(246, 181, 181," +opacity_a+")","rgba(179, 166, 223," +opacity_a+")",
"rgba(222, 235, 96," +opacity_a+")","rgba(226, 198, 155," +opacity_a+")","rgba(147, 92, 136," +opacity_a+")","rgba(217, 124, 115," +opacity_a+")",
"rgba(115, 171, 217," +opacity_a+")","rgba(184, 140, 142," +opacity_a+")","rgba(181, 228, 157," +opacity_a+")","rgba(79, 118, 255," +opacity_a+")"]




playerX =[player1, player2, player3, player4, player5, player6, player7, player8, player9, player10, player11, player12]
pos = [pos1,pos2,pos3,pos4,pos5,pos6,pos7,pos8,pos9,pos10,pos11,pos12]
post = [pos1t,pos2t,pos3t,pos4t,pos5t,pos6t,pos7t,pos8t,pos9t,pos10t,pos11t,pos12t]

#INDICATORS
indis = [indi1,indi2,indi3,indi4,indi5,indi6,indi7,indi8,indi9,indi10,indi11,indi12]

#GATES
gates_left = [gate_1_l,gate_2_l,gate_3_l,gate_4_l,gate_5_l,gate_6_l,gate_7_l,gate_8_l,gate_9_l,gate_10_l,gate_11_l,gate_12_l]
gates_right = [gate_1_r,gate_2_r,gate_3_r,gate_4_r,gate_5_r,gate_6_r,gate_7_r,gate_8_r,gate_9_r,gate_10_r,gate_11_r,gate_12_r]

for i in [0..players]
	gates_left[i].rotation = -20
	gates_left[i].originX = 0
	gates_right[i].rotation = 20
	gates_right[i].originX = 1
	indis[i].color = i_color[i]
#LIST SIDEBAR
listings = []
positionings = []
for line in [0..players]
  listing = new Layer
    width: player_list.width
    height: 36
    y: 36 * line
    parent: player_list
    backgroundColor: "rgba(255,255,255,0.02)"
    borderWidth: 0
    borderColor: "rgba(255,255,255,0.23)"
    borderRadius: 100
  listings.push(listing)
  positioning = new TextLayer
    fontSize: 10
    fontWeight: 700
    fontFamily: montserrat
    text: line + 1 + "th"
    textAlign: "center"
    padding:
      top: 6
    width: 40
    height: 24
    borderRadius: 100
    color: "grey"
    y: 6
    maxX: listing.maxX-6
    parent: listing
    color: "rgba(255,255,255,1)"
    backgroundColor: "rgba(0,0,0,0.1)"
  numbering = new TextLayer
    size: 24
    text: info_horse[1][line]
    fontSize: 10
    fontWeight: 500
    fontFamily: montserrat
    padding:
      top: 6
    textAlign: "center"
    color: "white"
    backgroundColor: a_color[line]
    borderColor: info_horse[4][line]
    borderWidth: 1
    x: 48
    y: 6
    borderRadius: 100
    parent: listing
  typeing = new TextLayer
    maxX: listing.maxX-6
    text: info_horse[2][line]
    padding:
      top: 8
    fontSize: 14
    fontFamily: montserrat
    parent: listing
    x: 260
    color: "rgba(255,255,255,0.2)"
  nameing = new TextLayer
    x: numbering.maxX + 12
    color: "white"
    text: info_horse[3][line]
    padding:
      top: 8
    fontSize: 14
    fontFamily: montserrat
    parent: listing
  gateing = new TextLayer
    parent: listing
    text: i_gate[line]
    fontSize: 14
    fontFamily: montserrat
    padding:
      top: 8
    x: 16
    color: "rgba(255,255,255,0.2)"

for i in [0..players]
	if i % 2 == 0
		listings[i].backgroundColor = "rgba(255,255,255,0)"


# console.log(listings);

#Distance Markers
distance_markers = []
for a in [0..hundreds]
	distance_marker = new TextLayer
		x: 5
		y: distance.height - 100 * scalefactor * a
		fontSize: 10
		text: a*100+"m"
		color: "rgba(255,255,255,0.12)"
		fontWeight: 800
		parent: distance
	distance_markers.push(distance_marker)
for a in [0..hundreds]
	horizontal_line = new Layer
		y: distance.height - 100 * scalefactor * a + 50*scalefactor
		height: 1
		width: 10
		backgroundColor: "rgba(255,255,255,0.1)"
		parent: distance

distance_markers[0].text = "Start"
distance_markers[0].color = "rgba(255,255,255,0.5)"
distance_markers[0].y = distance_markers[0].y-22
distance_marker.text = "Finish"
distance_marker.y = distance_marker.y

countdown = new TextLayer
	fontFamily: "Montserrat"
	fontWeight: 500
	textAlign: "center"
	text: "Race starts in"
	color: "white"
	parent: ridefield
	shadowSpread: 1
	shadowColor: "rgba(0,0,0,0.8)"
	shadowY: 8
	shadowBlur: 16
countdown.center()
countdownText = ["Race starts in", "5","4", "3","2","1","GO!"]
zx=0

for i in [0..players]
	horses[i].children[1].backgroundColor = info_horse[4][i]
	horses[i].children[0].text = info_horse[1][i]
	horses[i]['positions'] = 0
	horses[i]['positionsX'] = horses[i].x
	horses[i]['speed'] = horse_speed_base
	horses[i]['i'] = i
	horses[i]['speeds'] = [horse_speed_base]
	horses[i].get_avg_speed = () ->
		this.speeds.reduce((p, c) ->
			p + c
		, 0) / this.speeds.length
	console.log(horses);

#CHANGE HORSE RATINGS IN LIST
get_horse_rating = (horse_number) ->
  rating = horses.slice()
  rating.sort (a, b) ->
    (a.finished && b.finished && (a.finished - b.finished)) || (b.positions - a.positions)
  index = rating.findIndex (e) ->
    e.i == horse_number
  return index

#RACE
#VAR DECLARATION
start_time = datex[0]
race = false
finished = 0

#DELAY BEFORE START
Utils.delay 6.8, ->
	playerX[currentPlayer].borderColor = info_horse[4][currentPlayer]
	start_time = datex[0]
	for i in [0..players]
		gates_left[i].animate
			rotation : -85
			options: 
				time: 0.3
		gates_right[i].animate
			rotation : 85
			options: 
				time: 0.3
		horses[i].animate
			y: distance.height - horses[i]['positions']-meters-10
			backgroundColor: a_color[i]
			options:
				time: 0.3
				curve: Bezier.easeOut
		horses[i].children[1].opacity = 0
		horses[i].borderColor = info_horse[4][i]
		horses[i].backgroundColor = a_color[i]
	Utils.delay 1, ->
		if distance.height > ridefield.height
			distance.animate
				y: 60
				options:
					time: meters/horse_speed_base*0.94
					curve: Bezier.linear
	Utils.delay 3, ->
		bar1.animate
			x: 50
			width: Screen.width/4
			options:
				time: meters/horse_speed_base/3
				curve: Bezier.linear

#RACE TIMER
Utils.interval 0.1, ->
	if race == true
# 		if horses[i]['finished'] < players
		date_future = datex[0]
		delta = Math.abs(date_future - start_time) / 1000;
		
		days = Math.floor(delta / 86400);
		delta -= days * 86400;
		
		hours = Math.floor(delta / 3600) % 24;
		delta -= hours * 3600;
		minutes = Math.floor(delta / 60) % 60;
		delta -= minutes * 60;
		
		seconds = Utils.round(delta % 60, 2);
		
		race_time.text = "#{minutes}.#{seconds}"
bar2visible = false
#SHOW BOTTOM BAR
Utils.delay meters/horse_speed_base/2, ->
	bar2visible = true
	bar2.animate
		opacity: 1
		options: 
			time: 0.5
	if distance.height > ridefield.height
		distance.animate
			y: 100
			options:
				time: meters/horse_speed_base/2
				curve: Bezier.linear
	for i in [0..players]
		indis[i].y = indis[i].y-100

#RACING ALGORYTHM
a = Utils.interval 1, ->
	if zx < 7
		countdown.scale = 1
		countdown.opacity = 1
		countdown.text = countdownText[zx]
		countdown.center()
		zx += 1
		countdown.animate
			scale: 1.2
			opacity: 0
		for i in [0..players]
			horses[i].animate
				x: horses[i]['positionsX']+Utils.randomNumber(-csf, csf)
				y: distance.height - horses[i]['positions']-meters+Utils.randomNumber(-csf, csf)
				options:
					time: 1.5
					curve: Bezier.easeOut
	if zx == 7
		race = true
	if race == true
		now_time = datex[0]
		for i in [0..players]
			if horses[i]['finished']
				continue
			if 13*scalefactor < horses[i]['speed'] < 19*scalefactor
				horses[i]['speed'] += Utils.randomNumber(-csf, csf)
			else if horses[i]['speed'] > 19*scalefactor
				horses[i]['speed'] -= 1*scalefactor
			else if horses[i]['speed'] < 14*scalefactor
				horses[i]['speed'] += 1*scalefactor
			horses[i]['positions'] += horses[i]['speed']
			horses[i]['positionsX'] += Utils.randomNumber(-csf, csf)
			horses[i]['speeds'].push(horses[i]['speed'])
			if horses[i]['positions'] > meters
				finished += 1
				horses[i]['positions'] = meters + 30*scalefactor
				horses[i]['finished'] = finished
			horses[i].animate
				x: horses[i]['positionsX']
				y: distance.height - horses[i]['positions']-meters
				options:
					time: 2
					curve: Bezier.linear
		for i in [0..players]
			g = get_horse_rating(i)
			listings[i]['children'][0]['text'] = g+1+'th'
			listings[i]['children'][0]['backgroundColor'] = "rgba(0,0,0,0.1)"
			listings[i]['children'][0]['color'] = "grey"
			if g < 3
				listings[i]['children'][0]['backgroundColor'] = info_horse[4][i]
				listings[i]['children'][0]['color'] = "white"
			post[g].text = info_horse[1][i] + " " + info_horse[3][i]
			pos[g].backgroundColor = a_color[i]
			pos[g].borderColor = info_horse[4][i]
		if finished == players + 1
			rating = horses.slice()
			rating.sort (a, b) -> (a.finished - b.finished)
			rating = rating.filter (a) -> a.finished
			result = rating.map (o) ->
				{
					avg_speed: o.get_avg_speed(),
					name: o.name,
					place: o.finished
				}
			console.table(result)
			race = false
			clearInterval(a)
		for i in [0..players]
			if bar2visible == false
				if horses[i].screenFrame.y > Screen.height
					indis[i].opacity = 1
					indis[i].x = horses[i].screenFrame.x-sidebar.width+12
				else
					indis[i].opacity = 0
			else
				if horses[i].screenFrame.y > Screen.height-100
					indis[i].opacity = 1
					indis[i].x = horses[i].screenFrame.x-sidebar.width+12
				else
					indis[i].opacity = 0

#BUTTONS
hidden = false
button_hide.onTap (event, layer) ->
	if hidden == false
		sidebar.animate
			x: sidebar.x-sidebar.width + 100
		ridefield.animate
			x: ridefield.x-sidebar.width+50
			width: Screen.width-50
		bar1.animate
			width: Screen.width-50
		this.animate
			maxX: sidebar.maxX-30
		this.text = "Show"
		hidden = true
	else if hidden == true
		sidebar.animate
			x: sidebar.x+sidebar.width-100
		ridefield.animate
			x: ridefield.x+sidebar.width-50
			width: Screen.width-sidebar.width
		bar1.animate
			width: Screen.width-sidebar.width
		this.animate
			x: 20
		hidden = false

buttonR.onTap (event, layer) ->
	window.location.reload()