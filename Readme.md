<!-- dx-header -->
# Pindel (DNAnexus Platform App

This is the source code for an app that runs on the DNAnexus Platform.
http://platform.dnanexus.com/app/pindel

For more information about how to run or modify it, see
https://wiki.dnanexus.com/.
<!-- /dx-header -->
This app implements the Pindel tool (version 0.2.4t) for detection of structural variants (large deletions, medium sized insertions, inversions, tandem duplications, etc). 
For more information about the Pindel tool, please visit http://gmt.genome.wustl.edu/pindel/0.2.4/index

##Run Specifications
This app must have one of the following input combinations or it will raise an AppError:
1.  BAM file(s) with extension '.bam' from BWA/MOSAIK AND BAM config file (as specied at http://gmt.genome.wustl.edu/pindel/0.2.4/user-manual.html) OR insert size
2.  BAM file(s) with extension '.bam' not from BWA/MOSAIK AND bam_not_produced_by_bwa=True (default=False) AND sequence_platform AND insert size
3.  Pindel input file (as specified at http://gmt.genome.wustl.edu/pindel/0.2.4/user-manual.html)

##Versions
This app uses Pindel v.0.2.4t and Samtools v.0.1.19


