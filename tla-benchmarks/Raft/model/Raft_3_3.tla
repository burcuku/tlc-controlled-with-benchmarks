---- MODULE MC ----
EXTENDS raft, TLC

\* CONSTANT definitions @modelParameterConstants:0AppendEntriesResponse
const_167905646125114000 == 
"aer_message"
----

\* CONSTANT definitions @modelParameterConstants:1Follower
const_167905646125115000 == 
"state_follower"
----

\* CONSTANT definitions @modelParameterConstants:2Leader
const_167905646125116000 == 
"state_leader"
----

\* CONSTANT definitions @modelParameterConstants:3Nil
const_167905646125117000 == 
"nil"
----

\* CONSTANT definitions @modelParameterConstants:4RequestVoteResponse
const_167905646125118000 == 
"rvr_message"
----

\* CONSTANT definitions @modelParameterConstants:5Candidate
const_167905646125119000 == 
"state_candidate"
----

\* CONSTANT definitions @modelParameterConstants:6RequestVoteRequest
const_167905646125120000 == 
"rvre_message"
----

\* CONSTANT definitions @modelParameterConstants:7AppendEntriesRequest
const_167905646125121000 == 
"aere_message"
----

\* CONSTANT definitions @modelParameterConstants:8Value
const_167905646125122000 == 
{1,2,3}
----

\* CONSTANT definitions @modelParameterConstants:9Server
const_167905646125123000 == 
{1,2,3}
----

\* INIT definition @modelBehaviorNoSpec:0
init_167905646125124000 ==
FALSE/\elections = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_167905646125125000 ==
FALSE/\elections' = elections
----
=============================================================================
\* Modification History
\* Created Fri Mar 17 13:34:21 CET 2023 by srinidhin
