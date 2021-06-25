--//RUN: python3 %S/../../tools/sql-to-mlir/sql-to-mlir.py %s | mlir-db-opt -relalg-to-db -canonicalize | db-run "-" %S/../../resources/data/uni | FileCheck %s

--//CHECK: |                           sum  |                           min  |                           max  |                           avg  |                         count  |                         count  |
--//CHECK: -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--//CHECK: |                            30  |                             2  |                             4  |                             3.0  |                            10  |                            10  |


select sum(v.sws),min(v.sws),max(v.sws),avg(v.sws*1.0000),count(*),count(v.sws)
from vorlesungen v