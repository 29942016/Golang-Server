if params.len != 1 or params[0] == "-h" or params[0] == "--help" then exit("<b>Usage: "+program_path.split("/")[-1]+" [ip_address]</b>")
metaxploit = include_lib("/lib/metaxploit.so")
if not metaxploit then
    metaxploit = include_lib(current_path + "/metaxploit.so")
end if
if not metaxploit then exit("Error: Can't find metaxploit library in the /lib path or the current folder")
address = params[0]
net_session = metaxploit.net_use( address )
if not net_session then exit("Error: can't connect to net session")
metaLib = net_session.dump_lib
result = metaLib.overflow("", "")
if not result then exit("Program ended")

printFiles = function(folder)
	bins = folder.get_files
	for bin in bins
		print(bin.permissions + " " + bin.owner + " " + bin.group + " " + bin.path)
	end for
	folders = folder.get_folders
	for f in folders
		print(f.permissions + " " + f.owner + " " + f.group + " " + f.path)
		printFiles(f)
	end for
end function

if typeof(result) == "shell" then
	comp = result.host_computer
	//res = comp.touch("/Public/htdocs/downloads", "test")
	//print(res)
	fRoot = comp.File("/")
	fRootFolders = fRoot.get_folders
	content = []
	
	print(fRoot.permissions + " " + fRoot.path)
	
	printFiles(fRoot)
	// result.start_terminal
else
	print("Error: expected shell, obtained: " + result)
end if
