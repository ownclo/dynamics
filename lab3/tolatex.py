import string
import numpy as n

# Interface Functions
def toLatex(inf, outf):
	writeLatexs(readGnuplot(inf), outf) 

# Reader Functions
def readGnuplot (fname):
	with open(fname) as f:
		dataset = f.read()
		return loadData (filterStr('#', dataset))

def loadData (string):
	return [loadBlock(x) for x in string.split("\n\n") if x != '']

def loadBlock (string):
	return [[float(x) for x in line.split("\t")] 
				for line in string.split("\n") if line != '']

def filterStr(ch, string):
	parsed = [lines for lines in string.split("\n") 
					if lines == '' or lines[0] != ch]
	delim = '\n'
	return delim.join(parsed)

# Writer Functions
def writeGnuplots (db, fname):
	f = file (fname, 'w')
	f.write(saveGnuplots(db))

def writeLatexs (db, fname):
	f = file (fname, 'w')
	f.write(saveLatexs(db))

def saveGnuplots (db):
	return bumpBlocks (db, writeGnuplotBlock)

def saveLatexs (db):
	return bumpBlocks (db, writeLatexBlock)

def bumpBlocks (db, fn):
	sep = '\n\n\n'
	return sep.join([fn(block) for block in db])

def writeGnuplotBlock (block):
	return prettyWriter ('\t', '\n', block)

def writeLatexBlock (block):
	return prettyWriter (' & ', '\\\\\n', block)  + '\\\\'

def prettyWriter (sep, newl, block):
	return newl.join([sep.join([str(elem) for elem in string]) 
										  for string in block])
def rotate (array):
	return n.transpose(array).tolist()


if __name__ == '__main__':
	toLatex ('data', 'laTeXs')
