fasta = require("fasta")

f = fasta.parser("1eer.fasta.txt")
print(fasta.tostr(f))