from flask import Flask
app = Flask(__name__)

def getLightPattern(stadium, seciton, seat):
	if (stadium == 'Stadium1'):
		if (section == '1'):
			if (seat == '1A'):
				return '1,0,1,0,1,1,0,0,0,1,0,1,0'
			elif (seat == '1B'):
				return '1,0,1,0,1,0,1,0,0,1,0,1,0'
			elif (seat == '2A'):
				return '0,1,0,1,0,0,0,1,0,1,0,1,0'
			elif (seat == '2B'):
				return '0,1,0,1,0,0,0,0,1,1,0,1,0'
			else:
				return 'Invalid seat: ' + seat
		else:
			return 'Invalid section: ' + section
	else:
		return 'Invalid stadium: ' + stadium


@app.route("/")
def hello():
    return "Hello World!"

@app.route("/data/<stadium>/<section>/<seat>")
def getLightData(stadium, section, seat):
	# Set the start time and get epoch form
	startTime = '15.11.2014 7:30:00'
	pattern = '%d.%m.%Y %H:%M:%S'
	epochStart = int(time.mktime(time.strptime(startTime, pattern)))

	# Get the light pattern for the given seating info
	lightPattern = getLightPattern(stadium, seciton, seat)

	return str(epochStart) + ":" + lightPattern


if __name__ == "__main__":
    app.run(host='0.0.0.0', Debug=True)