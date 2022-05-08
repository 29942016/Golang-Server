
comp = get_shell.host_computer
user = user_input("Username: ", 0)

toCreate  = ["game", "over", "you", "got", "hacked", "by", "obst4"]
desktop = comp.File("/home/"+user+"/Desktop")

if desktop == null then exit("User desktop not found")

// Clear desktop
contents = [desktop.get_files, desktop.get_folders]

for collection in contents
	for i in collection
		i.delete
	end for	
end for

// Create our message on desktop
for file in toCreate
	r = comp.touch(desktop.path, file)
	if r == 1 then
		print("==> created " + r.name)
	else
		print(r)
	end if
end for
