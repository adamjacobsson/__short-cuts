venv() {
	python3 -m virtualenv venv
	source venv/bin/activate
}

mcd(){
	mkdir $1
	cd $1
}
