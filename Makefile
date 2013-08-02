SV=0.1.19
PV=0.2.4t

all: samtools pindel

samtools:
	make -C samtools-$(SV)
	cp samtools-$(SV)/samtools resources/usr/bin

pindel: samtools	
	#make -C pindel-$(PV) SAMTOOLS=../samtools-$(SV)
	cd pindel-$(PV) && ./INSTALL ../samtools-$(SV)
	cp pindel-$(PV)/pindel resources/usr/bin
	cp pindel-$(PV)/sam2pindel resources/usr/bin
	cp pindel-$(PV)/pindel2vcf resources/usr/bin
	cp pindel-$(PV)/bam2pindel.pl resources/usr/bin

clean:
	make -C samtools-$(SV) clean
	make -C pindel-$(PV) clean
	rm -f pindel-$(PV)/Makefile.local
	rm -f resources/usr/bin/*
