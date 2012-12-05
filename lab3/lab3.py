import tolatex as t


if __name__ == '__main__':
	array = t.readGnuplot('rotDb')
	array = [t.rotate(table) for table in array]
	t.writeGnuplots (array, 'Data-2')
	t.writeLatexs(array, 'Latexs-2')