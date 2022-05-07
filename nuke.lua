iterate = function(folder)
	bins = folder.get_files
	for bin in bins
		if bin.name == "p3n71n3l" then
			print("=>" + bin.name)
			n = bin.name
			r = bin.delete
			if r.len > 0 then
				print(r)
			else
				print("File deleted OK " + n)
			end if
			print("==")
		end if
	end for
	folders = folder.get_folders
	for f in folders
		printFiles(f)
	end for
end function
  
  fRoot = result.File("/")
	iterate(fRoot)
  
