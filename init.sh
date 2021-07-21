mkdir -p  ~/adamame
cp -r shell/* ~/adamame

STRING=$(cat ~/.zshrc | grep -c "adamame")

if [ "$STRING" -eq 0 ]; then 
	echo "for file in \""\$HOME/adamame/\""*.sh; do source "\"\$file\""; done" >> ~/.zshrc
else
	echo "Files already sourced..."
fi
