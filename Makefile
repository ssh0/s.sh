README.md: s providers
	@echo -e "s\n===\n\ns - Search from terminal\n\n\`\`\`" > README.md
	@./s -h >> README.md
	@echo -e "\`\`\`\n\nProviders\n---------\n" >> README.md
	@echo "|Alias |Providers                                 |" >> README.md
	@echo "|---   |---                                       |" >> README.md
	@./s -l | awk -F : '{printf "|%4s| %40s |\n", $$1, $$2;}' >> README.md
	@echo -e "\nHow to add providers\n--------------------\n" >> README.md
	@nl -w3 -s- -nln -d'#=' -ha -bn -fn providers | grep -ve '^\s\+' | cut -b7- >> README.md
