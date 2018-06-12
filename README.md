git clone https://github.com/green-haskell/criterion.git

git clone https://github.com/gilbertomelfe/edison.git

git clone https://github.com/green-haskell/dramEnergyMeasuring.git

cd dramEnergyMeasuring

cabal sandbox init

cabal sandbox add-source ../criterion/

cabal sandbox add-source ../edison/edison-api/

cabal sandbox add-source ../edison/edison-core/

cd <assocCollections|coll-Heaps|coll-Sets|seqs>

cabal sandbox init --sandbox=../.cabal-sandbox/

cabal install --dependencies-only

\#To run: as root, in each abstraction directory

make 2>&1 | tee fullOutput.txt

