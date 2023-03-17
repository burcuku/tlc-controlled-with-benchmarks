---- MODULE MC ----
EXTENDS raft, TLC

\* CONSTANT definitions @modelParameterConstants:0AppendEntriesResponse
const_16790564349872000 == 
"aer_message"
----

\* CONSTANT definitions @modelParameterConstants:1Follower
const_16790564349903000 == 
"state_follower"
----

\* CONSTANT definitions @modelParameterConstants:2Leader
const_16790564349904000 == 
"state_leader"
----

\* CONSTANT definitions @modelParameterConstants:3Nil
const_16790564349905000 == 
"nil"
----

\* CONSTANT definitions @modelParameterConstants:4RequestVoteResponse
const_16790564349906000 == 
"rvr_message"
----

\* CONSTANT definitions @modelParameterConstants:5Candidate
const_16790564349907000 == 
"state_candidate"
----

\* CONSTANT definitions @modelParameterConstants:6RequestVoteRequest
const_16790564349908000 == 
"rvre_message"
----

\* CONSTANT definitions @modelParameterConstants:7AppendEntriesRequest
const_16790564349909000 == 
"aere_message"
----

\* CONSTANT definitions @modelParameterConstants:8Value
const_167905643499010000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:9Server
const_167905643499011000 == 
{1,2,3}
----

\* INIT definition @modelBehaviorNoSpec:0
init_167905643499012000 ==
FALSE/\elections = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_167905643499013000 ==
FALSE/\elections' = elections
----
=============================================================================
\* Modification History
\* Created Fri Mar 17 13:33:54 CET 2023 by srinidhin
