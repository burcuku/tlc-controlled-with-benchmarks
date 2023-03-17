---- MODULE MC ----
EXTENDS raft, TLC

\* CONSTANT definitions @modelParameterConstants:0AppendEntriesResponse
const_167905651111338000 == 
"aer_message"
----

\* CONSTANT definitions @modelParameterConstants:1Follower
const_167905651111739000 == 
"state_follower"
----

\* CONSTANT definitions @modelParameterConstants:2Leader
const_167905651111740000 == 
"state_leader"
----

\* CONSTANT definitions @modelParameterConstants:3Nil
const_167905651111741000 == 
"nil"
----

\* CONSTANT definitions @modelParameterConstants:4RequestVoteResponse
const_167905651111742000 == 
"rvr_message"
----

\* CONSTANT definitions @modelParameterConstants:5Candidate
const_167905651111743000 == 
"state_candidate"
----

\* CONSTANT definitions @modelParameterConstants:6RequestVoteRequest
const_167905651111744000 == 
"rvre_message"
----

\* CONSTANT definitions @modelParameterConstants:7AppendEntriesRequest
const_167905651111745000 == 
"aere_message"
----

\* CONSTANT definitions @modelParameterConstants:8Value
const_167905651111746000 == 
{1,2}
----

\* CONSTANT definitions @modelParameterConstants:9Server
const_167905651111747000 == 
{1,2,3,4}
----

\* INIT definition @modelBehaviorNoSpec:0
init_167905651111748000 ==
FALSE/\elections = 0
----
\* NEXT definition @modelBehaviorNoSpec:0
next_167905651111749000 ==
FALSE/\elections' = elections
----
=============================================================================
\* Modification History
\* Created Fri Mar 17 13:35:11 CET 2023 by srinidhin
