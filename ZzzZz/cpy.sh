cpy() {
	if [ -z "$1" ]
	then
    	echo "Project name needs to be an argument \"cpy <project_name>\""
    	return 0
	fi

	mkdir -p  $1/source
	cp "$HOME/adamame/pyrightconfig.json" $1
	cd $1/source
	touch app.py

	venv
}
