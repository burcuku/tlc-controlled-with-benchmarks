---- MODULE MC ----
EXTENDS raft, TLC

\* CONSTANT definitions @modelParameterConstants:0AppendEntriesResponse
const_167905649190126000 == 
"aer_message"
----

\* CONSTANT definitions @modelParameterConstants:1Follower
const_167905649190227000 == 
"state_follower"
----

\* CONSTANT definitions @modelParameterConstants:2Leader
const_167905649190228000 == 
"state_leader"
----

\* CONSTANT definitions @modelParameterConstants:3Nil
const_167905649190229000 == 
"nil"
----

\* CONSTANT definitions @modelParameterConstants:4RequestVoteResponse
const_167905649190230000 == 
"rvr_message"
----

\* CONSTANT definitions @modelParameterConstants:5Candidate
const_167905649190231000 == 
"state_candidate"
----

\* CONSTANT definitions @modelParameterConstants:6RequestVoteRequest
const_167905649190232000 == 
"rvre_message"
----

\* CONSTANT definitions @modelParameterConstants:7AppendEntriesRequest
const_167905649190233000 == 
"aere_message"
----

\* CONSTANT definitions @modelParameterConstants:8Value
const_167905649190234000 == 
{1}
----

\* CONSTANT definitions @modelParameterConstants:9Server
const_167905649190235000 == 
{1,2,3,4}
----

\* INIT definition @modelBehaviorNoSpec:0
init_167905649190236000 ==
FALSE/\elections = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_167905649190237000 ==
FALSE/\elections' = elections
----
=============================================================================
\* Modification History
\* Created Fri Mar 17 13:34:51 CET 2023 by srinidhin
