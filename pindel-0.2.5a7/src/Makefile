# Makefile for pindel and pindel-debug
# Include the Makefile.local from the main project for configuration
include ../Makefile.local

SOURCES=pindel.cpp reader.cpp reporter.cpp searcher.cpp parameter.cpp \
    refreader.cpp control_state.cpp search_deletions_nt.cpp \
    search_inversions.cpp search_inversions_nt.cpp bam2depth.cpp\
    search_tandem_duplications.cpp search_tandem_duplications_nt.cpp \
    output_sorter.cpp farend_searcher.cpp search_variant.cpp \
    searchshortinsertions.cpp searchdeletions.cpp output_file_data.cpp \
    bddata.cpp shifted_vector.cpp read_buffer.cpp \
    line_reader.cpp ifstream_line_reader.cpp gz_line_reader.cpp\
    pindel_read_reader.cpp user_defined_settings.cpp \
    fn_parameters.cpp logstream.cpp search_MEI_util.cpp \
    search_MEI.cpp assembly.cpp genotyping.cpp

#search_MEI.cpp


#   bddata.cpp shifted_vector.cpp read_buffer.cpp assembly.cpp genotyping.cpp\
 
all:	pindel pindel-debug
-include $(SOURCES:.cpp=.d)
-include $(SOURCES:.cpp=-debug.d)
test:	pindel $(addprefix cppcheck-result-,$(SOURCES:.cpp=.xml))

# Debug version of pindel
pindel-debug: $(SOURCES:.cpp=-debug.o)
	$(CXX) $(LDFLAGS) $^ -fopenmp -g -pg -fprofile-arcs -ftest-coverage \
	  -lm -lz -L$(SAMTOOLS) -lbam -o $@
#	$(CXX) $(LDFLAGS) $^ -fopenmp -g -pg -fprofile-arcs -ftest-coverage \
#	-static-libgcc -Bstatic -static -lm -lz -L$(SAMTOOLS) -lbam -o $@

# Normal version of pindel	
pindel:	$(SOURCES:.cpp=.o)
	$(CXX) $(LDFLAGS) $^ -O3 -fopenmp -lm -lz -L$(SAMTOOLS) -lbam -o $@
#	$(CXX) $(LDFLAGS) $^ -O3 -fopenmp -Bstatic -static-libgcc -static  -lm -lz -L$(SAMTOOLS) -lbam -o $@
	$(CXX) -O3 SAM_2_PINDEL_cin_2011Sept26.cpp -o sam2pindel
	$(CXX) -O3 vcfcreator.cpp -o pindel2vcf

clean:
	$(RM) pindel pindel2vcf pindel-debug $(OBJECTS) $(OBJECTS_DEBUG) $(CPPCHECKS) \
	    *.gcov *.gcda *.gcno gmon.out *.d *.o

# Pattern rule to create normal .o files	
%.o: %.cpp
	$(CXX) $(CXXFLAGS) -Wall -g -c -O3 -fopenmp -I$(SAMTOOLS) $< -o $@
#	$(CXX) $(CXXFLAGS) -Wall -g -c -O3 -Bstatic -static-libgcc -static -fopenmp -I$(SAMTOOLS) $< -o $@

# Pattern rule to create debug version of .o files
%-debug.o: %.cpp
	$(CXX) $(CXXFLAGS) -Wall -g -c -fopenmp -g -pg \
	  -fprofile-arcs -ftest-coverage -I$(SAMTOOLS) $< -o $@
#	$(CXX) $(CXXFLAGS) -Wall -Bstatic -static-libgcc -static -g -c -fopenmp -g -pg \
	  -fprofile-arcs -ftest-coverage -I$(SAMTOOLS) $< -o $@

# Pattern rule to create cppcheck files	
cppcheck-result-%.xml: %.cpp
	cppcheck --quiet --enable=all --xml -I$(SAMTOOLS) $(realpath $<) 2> $@

# Pattern rule to create the .d dependency files
%.d: %.cpp
	@set -e; rm -f $@; \
	    $(CXX) -I$(SAMTOOLS) -MM $(CPPFLAGS) $< > $@.$$$$; \
	    sed 's,\($*\)\.o[ :]*,\1.o $@ : ,g' < $@.$$$$ > $@; \
	    $(RM) $@.$$$$

# Pattern rule to create the .d dependency files for the debug version
%-debug.d: %.cpp
	@set -e; rm -f $@; \
	    $(CXX) -I$(SAMTOOLS) -MM $(CPPFLAGS) $< > $@.$$$$; \
	    sed 's,\($*\)\.o[ :]*,\1-debug.o $@ : ,g' < $@.$$$$ > $@; \
	    $(RM) $@.$$$$
	
# Pseudo targets for configuration
.PHONY: all clean test
.IGNORE: clean
