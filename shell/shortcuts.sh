cpy() {
	# Creates basic python structure
	if [ -z "$1" ]
	then
    	    echo "Project name needs to be an argument \"cpy <project_name>\""
    	    return 0
	fi

	mcd  $1/source
	touch app.py

	venv
}

venv() {
	# initiates virtualenv for python
	python3 -m virtualenv venv
	source venv/bin/activate
}

mcd() {
	# mkdir -> cd to dir
	mkdir $1
	cd $1
}

cfl() {
	# creates basic flask structure
	mcd $1
	venv
	mkdir templates static assets
	mkdir static/css static/fonts
	touch app.py requirements.txt README.md
}
