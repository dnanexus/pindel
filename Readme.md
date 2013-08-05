<!-- dx-header -->
# Pindel (DNAnexus Platform App

This is the source code for an app that runs on the DNAnexus Platform.
For more information about how to run or modify it, see
https://wiki.dnanexus.com/.
<!-- /dx-header -->
This app implements the Pindel tool (version 0.2.4t) for detection of structural variants (large deletions, medium sized insertions, inversions, tandem duplications, etc). For more information about the Pindel tool, please visit http://gmt.genome.wustl.edu/pindel/0.2.4/index

##Versions
This app uses Pindel v.0.2.4t and Samtools v.0.1.19

##Pindel Help
Pindel version 0.2.4t, August 13 2012.

Program:   pindel (detection of indels and structural variations)
Pindel version 0.2.4t, August 13 2012.
Contact:   Kai Ye <k.ye@lumc.nl>

Usage:     pindel -f <reference.fa> -p <pindel_input>
           [and/or -i bam_configuration_file]
           -c <chromosome_name> -o <prefix_for_output_file>

Required parameters:
           -f/--fasta
           the reference genome sequences in fasta format 

           -p/--pindel-file
           the Pindel input file; either this, a pindel configuration file 
           (consisting of multiple pindel filenames) or a bam configuration file 
           is required 

           -i/--config-file
           the bam config file; either this, a pindel input file, or a pindel 
           config file is required. Per line: path and file name of bam, insert 
           size and sample tag.     For example: /data/tumour.bam  400  tumour 

           -o/--output-prefix
           Output prefix; 


Optional parameters:
           -P/--pindel-config-file
           the pindel config file, containing the names of all Pindel files that 
           need to be sampled; either this, a bam config file or a pindel input 
           file is required. Per line: path and file name of pindel input. 
           Example: /data/tumour.txt 

           -c/--chromosome
           Which chr/fragment. Pindel will process reads for one chromosome each 
           time. ChrName must be the same as in reference sequence and in read 
           file. '-c ALL' will make Pindel loop over all chromosomes. The search 
           for indels and SVs can also be limited to a specific region; -c 
           20:10,000,000 will only look for indels and SVs after position 
           10,000,000 = [10M, end], -c 20:5,000,000-15,000,000 will report 
           indels in the range between and including the bases at position 
           5,000,000 and 15,000,000 = [5M, 15M]. (default ALL) 

           -h/--help
           show the command line options of Pindel 

           -T/--number_of_threads
           the number of threads Pindel will use (default 1). 

           -x/--max_range_index
           the maximum size of structural variations to be detected; the higher 
           this number, the greater the number of SVs reported, but the 
           computational cost and memory requirements increase, as does the rate 
           of false positives. 1=128, 2=512, 3=2,048, 4=8,092, 5=32,368, 
           6=129,472, 7=517,888, 8=2,071,552, 9=8,286,208. (maximum 9, default 
           5) 

           -w/--window_size
           for saving RAM, divides the reference in bins of X million bases and 
           only analyzes the reads that belong in the current bin, (default 10 
           (=10 million)) 

           -e/--sequencing_error_rate
           the expected fraction of sequencing errors (default 0.03) 

           -u/--maximum_allowed_mismatch_rate
           Only reads with no less than this fraction of mismatches than the 
           reference genome will be considered. (default 0.05) 

           -r/--report_inversions
           report inversions (default true) 

           -t/--report_duplications
           report tandem duplications (default true) 

           -l/--report_long_insertions
           report insertions of which the full sequence cannot be deduced 
           because of their length (default true) 

           -k/--report_breakpoints
           report breakpoints (default true) 

           -s/--report_close_mapped_reads
           report reads of which only one end (the one closest to the mapped 
           read of the paired-end read) could be mapped. (default false) 

           -S/--report_only_close_mapped_reads
           do not search for SVs, only report reads of which only one end (the 
           one closest to the mapped read of the paired-end read) could be 
           mapped (the output file can then be used as an input file for another 
           run of pindel, which may save size if you need to transfer files). 
           (default false) 

           -b/--breakdancer
           Pindel is able to use calls from other SV methods such as BreakDancer 
           to further increase sensitivity and specificity.                    
           BreakDancer result or calls from any methods must in the format:   
           ChrA LocA stringA ChrB LocB stringB other 

           -a/--additional_mismatch
           Pindel will only map part of a read to the reference genome if there 
           are no other candidate positions with no more than the specified 
           number of mismatches position. The bigger tha value, the more 
           accurate but less sensitive. (default value 1) 

           -m/--min_perfect_match_around_BP
           at the point where the read is split into two, there should at least 
           be this number of perfectly matching bases between read and reference 
           (default value 3) 

           -v/--min_inversion_size
           only report inversions greater than this number of bases (default 50) 

           -d/--min_num_matched_bases
           only consider reads as evidence if they map with more than X bases to 
           the reference. (default 30) 

           -B/--balance_cutoff
           the number of bases of a SV above which a more stringent filter is 
           applied which demands that both sides of the SV are mapped with 
           sufficiently long strings of bases (default 100) 

           -A/--anchor_quality
           the minimal mapping quality of the reads Pindel uses as anchor 
           (default 20) 

           -M/--minimum_support_for_event
           Pindel only calls events which have this number or more supporting 
           reads (default 3) 

           -z/--input_SV_Calls_for_assembly
           A filename of a list of SV calls for assembling breakpoints 
            Types: DEL, INS, DUP, INV, CTX and ITX 
            File format: Type chrA posA Confidence_Range_A chrB posB 
           Confidence_Range_B 
            Example: DEL chr1 10000 50 chr2 20000 100 

           -g/--genotyping
           gentype variants if -i is also turn true. 

           -Q/--output_of_breakdancer_events
           If breakdancer input is used, you can specify a filename here to 
           write the confirmed breakdancer events with their exact breakpoints 
           to The list of BreakDancer calls with Pindel support information. 
           Format: chr   Loc_left   Loc_right   size   type   index.             
           For example, "1	72766323 	72811840 	45516	D	11970" means the deletion 
           event chr1:72766323-72811840 of size 45516 is reported as an event 
           with index 11970 in Pindel report of deletion. 

           -L/--name_of_logfile
           Specifies a file to write Pindel's log to (default: no logfile, log 
           is written to the screen/stdout) 

           -q/--detect_MEI
           Flag indicating whether to search for mobile element insertions. 
