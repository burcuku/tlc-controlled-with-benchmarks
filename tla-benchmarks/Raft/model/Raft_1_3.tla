---- MODULE RAFT_1_3 ----
EXTENDS raft, TLC

\* CONSTANT definitions @modelParameterConstants:0AppendEntriesResponse
const_167905041491698000 == 
"aer_message"
----

\* CONSTANT definitions @modelParameterConstants:1Follower
const_167905041491699000 == 
"state_follower"
----

\* CONSTANT definitions @modelParameterConstants:2Leader
const_1679050414916100000 == 
"state_leader"
----

\* CONSTANT definitions @modelParameterConstants:3Nil
const_1679050414916101000 == 
0
----

\* CONSTANT definitions @modelParameterConstants:4RequestVoteResponse
const_1679050414916102000 == 
"rvr_message"
----

\* CONSTANT definitions @modelParameterConstants:5Candidate
const_1679050414916103000 == 
"state_candidate"
----

\* CONSTANT definitions @modelParameterConstants:6RequestVoteRequest
const_1679050414916104000 == 
"rvre_message"
----

\* CONSTANT definitions @modelParameterConstants:7AppendEntriesRequest
const_1679050414916105000 == 
"aere_message"
----

\* CONSTANT definitions @modelParameterConstants:8Value
const_1679050414916106000 == 
{1}
----

\* CONSTANT definitions @modelParameterConstants:9Server
const_1679050414916107000 == 
{1,2,3}
----

\* INIT definition @modelBehaviorNoSpec:0
init_1679050414916108000 ==
FALSE/\elections = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_1679050414916109000 ==
FALSE/\elections' = elections
----
=============================================================================
\* Modification History
\* Created Fri Mar 17 11:53:34 CET 2023 by srinidhin
