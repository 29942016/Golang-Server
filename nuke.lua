iterate = function(folder)
	bins = folder.get_files
	for bin in bins
		if bin.name == "testxyz" then
			n = bin.name
			r = bin.delete
			if r.len > 0 then
				print(r)
			else
				print("File deleted OK " + n)
			end if
		end if
	end for
	folders = folder.get_folders
	for f in folders
		iterate(f)
	end for
end function
  
fRoot = get_shell.host_computer.File("/")
iterate(fRoot)
