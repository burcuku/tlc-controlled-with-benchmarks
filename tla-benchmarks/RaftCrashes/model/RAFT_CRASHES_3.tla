---- MODULE RAFT_CRASHES_3 ----
EXTENDS raft_crashes, TLC

\* CONSTANT definitions @modelParameterConstants:0Follower
const_16884581212942000 == 
"follower"
----

\* CONSTANT definitions @modelParameterConstants:1Leader
const_16884581212943000 == 
"leader"
----

\* CONSTANT definitions @modelParameterConstants:2Server
const_16884581212954000 == 
{1,2,3}
----

\* CONSTANT definitions @modelParameterConstants:3Candidate
const_16884581212955000 == 
"candidate"
----

=============================================================================
\* Modification History
\* Created Tue Jul 04 10:08:41 CEST 2023 by srinidhin
