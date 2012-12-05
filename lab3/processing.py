def load (array):
	table = []
	f = file ('data', 'r')
	for line in f:
		if line[0] == '\n':
			array.append([table])
			table = []

		if line[0] != '#':
			table.append([int(x) for x in line.split("\t")])

#		while line[0] != '\n':
#			if line[0] != '#':
#				array.append([int(x) for x in line.split("\t")])