#!/bin/bash

setImplementations = StandardSet \
UnbalancedSet


main:
	for setImplementation in $(setImplementations) ; \
		do \
		echo -e "\n\nProcessing "$$setImplementation"...\n\n" ; \
		date ; \
		cabal configure ; \
		cabal build compileForAllSetImplementations ; \
		cp setImplementations/$$setImplementation.txt ./setImplementations.txt ; \
		mkdir -p tmp && mkdir -p tmp/executables ; \
		./dist/build/compileForAllSetImplementations/compileForAllSetImplementations ; \
		cabal configure ; \
		cabal build runForAllBenchmarkTypes ; \
		modprobe msr ; \
		./dist/build/runForAllBenchmarkTypes/runForAllBenchmarkTypes ; \
		chown $(USER):users time-Time.csv packageEnergy-Energy.csv dramEnergy-Energy.csv; \
		mkdir -p csvFileSets ; \
		mv time-Time.csv csvFileSets/$$setImplementation.time.csv ; \
		mv packageEnergy-Energy.csv csvFileSets/$$setImplementation.packageEnergy.csv ; \
		mv dramEnergy-Energy.csv csvFileSets/$$setImplementation.dramEnergy.csv ; \
		date ; \
		rm -fr dist/ ; \
	done


clean :
	cabal clean
	rm -f tmp/executables/*


