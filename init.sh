mkdir -p  ~/adamame
cp -r shell/* ~/adamame

STRING=$(cat ~/.zshrc | grep -c "adamame")
SCRIPT_PATH=$(pwd)
if [ "$STRING" -eq 0 ]; then 
	echo "for file in \""${SCRIPT_PATH}/shell/\""*.sh; do source "\"\$file\""; done" >> ~/.zshrc
else
	echo "Files already sourced..."
fi
