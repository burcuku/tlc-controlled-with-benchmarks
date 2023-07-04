---- MODULE RAFT_CRASHES_5 ----
EXTENDS raft_crashes, TLC

\* CONSTANT definitions @modelParameterConstants:0Follower
const_16884579450356000 == 
"follower"
----

\* CONSTANT definitions @modelParameterConstants:1Leader
const_16884579450367000 == 
"leader"
----

\* CONSTANT definitions @modelParameterConstants:2Server
const_16884579450368000 == 
{1,2,3,4,5}
----

\* CONSTANT definitions @modelParameterConstants:3Candidate
const_16884579450369000 == 
"candidate"
----

=============================================================================
\* Modification History
\* Created Tue Jul 04 10:05:45 CEST 2023 by srinidhin
