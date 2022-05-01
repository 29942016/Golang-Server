cryptools = include_lib("/lib/crypto.so")
if not cryptools then exit("Error: Missing crypto library")

GetPassword = function(userPass)
	if userPass.len != 2 then exit("decipher: " + file.path + " wrong syntax")
	password = cryptools.decipher(userPass[1])
	return password
end function

if params.len != 1 or params[0] == "-h" or params[0] == "--help" then exit(command_info("decipher_usage"))

origFile = params[0]
file = get_shell.host_computer.File(origFile)
if not file then exit("decipher: can't find " + origFile)
if not file.has_permission("r") then exit("can't read file. Permission denied")
if file.get_content.len == 0 then exit("decipher: no users found")
	
lines = file.get_content.split("\n")
password = null

if lines.len == 1 then
	userPass = lines[0].split(":")
	password = GetPassword(userPass)
	if not password then exit("Can't find password :(")
	print(userPass[0] + ":" + password)
else
	print("Multiple users found.")
	numLine = 1
	for line in lines
		if line.len > 0 then
			print(numLine + ": " + line)
			numLine = numLine + 1
		end if
	end for

	print("\n")
	
	combinations = []
	
	for line in lines
		print("#" + lines.indexOf(line))
		userPass = line.split(":")
		password = GetPassword(userPass)
		combinations.push(userPass[0] + ":" + password)
	end for

	for combination in combinations
		print(combination)
	end for

end if
