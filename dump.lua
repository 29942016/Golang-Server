computer = get_shell.host_computer
fHome = computer.File("/home")

fUsers = fHome.get_folders
fBanks = []
fMails = []

for fUser in fUsers
	fBank = computer.File("/home/" + fUser.name + "/Config/Bank.txt")
	fMail = computer.File("/home/" + fUser.name + "/Config/Mail.txt")
	
	if not fBank then 
		print("\n[X] Couldn't access bank of: " + fUser.name) 
		continue 
	end if
	fBanks.push(fBank);
	
	if not fMail then
		print("\n[X] Couldn't access mail of: " + fUser.name)
		continue
	end if
	fMails.push(fMail);
end for

if fBanks.len >= 0 then
	print("\nBanks:")
	for fBank in fBanks 
		print("| " + fBank.path)
		print("| " + fBank.get_content)
	end for
end if

if fMails.len >= 1 then
	print("\nMail:")
	for fMail in fMails
		print("| " + fMail.path)
		print("| " + fMail.get_content)
	end for
end if

print("")
