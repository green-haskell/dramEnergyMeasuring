module Main where


import Criterion.Main

--import Criterion.Main.Options

import Criterion.Types (
    Config ( .. )
    )


--import qualified Data.Edison.Seq.BankersQueue as S

--import qualified Data.Edison.Seq.BinaryRandList as S

--import qualified Data.Edison.Seq.BraunSeq as S

--import qualified Data.Edison.Seq.FingerSeq as S

--import qualified Data.Edison.Seq.JoinList as S

--import qualified Data.Edison.Seq.ListSeq as S

--import qualified Data.Edison.Seq.MyersStack as S

--import qualified Data.Edison.Seq.RandList as S

--import qualified Data.Edison.Seq.SimpleQueue as S

import qualified Data.Edison.Seq.SimpleQueue as S


-- ---------- ---------- ---------- ---------- ---------- ---------- ----------

import BenchmarksConfig

import Defs

import Ops

import Environments


-- ---------- ---------- ---------- ---------- ---------- ---------- ----------

{-
{-# LANGUAGE DeriveGeneric #-}

import GHC.Generics (Generic)
-}

--import Control.DeepSeq

--instance NFData a => NFData (S.Seq a)


-- ---------- ---------- ---------- ---------- ---------- ---------- ----------

-- Benchmarks

main =
    defaultMainWith myBenchmarkConfig [

        bgroup ( "Sequence/" ++ S.moduleName ) [

            env addEnvSetup $ \ ~s -> bench addOpDesc $ nf ( addNDistinctFrom s addFromNElems ) 0

            , env addAllEnvSetup $ \ ~( s , t ) -> bench addAllOpDesc $ nf ( addAllNTimes s t ) addAllNRepeats

            , env clearEnvSetup $ \ ~s -> bench clearOpDesc $ nf clear s

            , env containsEnvSetup $ \ ~s -> bench containsOpDesc $ nf ( containsNTimes s containsElement ) containsNRepeats

            , env containsAllEnvSetup $ \ ~( s , t ) -> bench containsAllOpDesc $ nf ( containsAllNTimes s t ) containsAllNRepeats

            , env iteratorEnvSetup $ \ ~s -> bench iteratorOpDesc $ nf iterator s

            , env removeEnvSetup $ \ ~s -> bench removeOpDesc $ nf ( removeNTimes s ) removeNRepeats

            , env removeAllEnvSetup $ \ ~( s , t ) -> bench removeAllOpDesc $ nf ( removeAllNTimes s t ) removeAllNRepeats

            , env retainAllEnvSetup $ \ ~( s , t ) -> bench retainAllOpDesc $ nf ( retainAllNTimes s t ) retainAllNRepeats

            , env toListEnvSetup $ \ ~s -> bench toListOpDesc $ nf ( toListNTimes s ) toListNRepeats
        ]
    ]


-- ---------- ---------- ---------- ---------- ---------- ---------- ----------


