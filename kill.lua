computer = get_shell.host_computer;

procs = computer.show_procs
lines = procs.split("\n")
pids = []

for line in lines
	spaceIndex = line.indexOf(" ")
	nextSpaceIndex = line.indexOf(" ", spaceIndex)
	pid = line[spaceIndex : nextSpaceIndex].val
	if pid != 0 then
		pids.push(pid)
	end if
end for

for proc in pids
	r = computer.close_program(proc)
	if r == 1 then
		print("Process " + proc + " killed")
	else if r == 0 then
		print("Process " + proc + " cannot be found")
	else
		print(r)
	end if
end for
