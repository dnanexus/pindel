# This file is a part of pindel.
# Copyright (C) 2013 DNAnexus, Inc.
#
# This program is free software: you can redistribute it and/or modify it under
# the terms of the GNU General Public License as published by the Free Software
# Foundation, either version 3 of the License, or (at your option) any later
# version.
#
# This program is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or FITNESS
# FOR A PARTICULAR PURPOSE. See the GNU General Public License for more
# details.
#
# You should have received a copy of the GNU General Public License along with
# this program. If not, see <http://www.gnu.org/licenses/>.

SV=0.1.19
PV=0.2.5a7

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
