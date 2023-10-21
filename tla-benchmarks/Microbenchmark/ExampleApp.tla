------------------------------- MODULE ExampleApp -------------------------------
EXTENDS Naturals, TLC, FiniteSets

CONSTANT N   \* The number of requests
CONSTANT M   \* The number of workers

VARIABLES
    appMasterState,
    workerState,
    workerBuffer,
    terminatorState,
    msgs
    
Messages ==
    [type : {"RegisterWorker", "RegisterTerminator", "Request"}] \cup [type : {"Execute"}, req : (0..N), worker : M] \cup [type : {"Terminate", "Flush"}, worker : M]
    
TypeOK ==
    /\ appMasterState \in [w : (0..M), t : {0, 1}, state : {"init", "ready", "inProgress"}]
    /\ workerState \in [M -> [state: {"working", "completed", "flushed"}]]
    /\ workerBuffer \subseteq (0..N) 
    /\ terminatorState \in {"working", "terminating"}
    /\ msgs \subseteq Messages
    
Init ==
    /\ appMasterState = [w |-> 0, t |-> 0, state |-> "init"]
    /\ workerState = [w \in M |-> [state |-> "working"]]
    /\ workerBuffer = {}
    /\ terminatorState = "working"
    /\ msgs = {}

WorkerRegister(w) ==
    /\ workerState[w]["state"] = "working"
    /\ msgs' = msgs \cup {[type |-> "RegisterWorker"]}
    /\ UNCHANGED <<appMasterState, terminatorState, workerBuffer, workerState>>

MasterRegisterWorker ==
    /\ appMasterState["state"] = "init"
    /\ appMasterState["w"] <= Cardinality(M)
    /\ [type |-> "RegisterWorker"] \in msgs
    /\ appMasterState' = IF appMasterState = [w |-> Cardinality(M) - 1, t |-> 1, state |-> "init"] THEN [w |-> Cardinality(M), t |-> 1, state |-> "ready"] ELSE [w |-> appMasterState["w"] + 1, t |-> appMasterState["t"], state |-> "init"]
    /\ UNCHANGED <<workerState, terminatorState, msgs, workerBuffer>>

TerminatorRegister ==
    /\ terminatorState = "working"
    /\ msgs' = msgs \cup {[type |-> "RegisterTerminator"]}
    /\ UNCHANGED <<appMasterState, workerState, workerBuffer, terminatorState>>

MasterRegisterTerminator ==
    /\ appMasterState["state"] = "init"
    /\ appMasterState["t"] <= 1
    /\ [type |-> "RegisterTerminator"] \in msgs
    /\ appMasterState' = IF appMasterState = [w |-> Cardinality(M), t |-> 0, state |-> "init"] THEN [w |-> Cardinality(M), t |-> 1, state |-> "ready"] ELSE [w |-> appMasterState["w"], t |-> appMasterState["t"] + 1, state |-> "init"]
    /\ UNCHANGED <<workerState, terminatorState, msgs, workerBuffer>>
    
MasterRcvRequest(w, r) ==
    /\ appMasterState["state"] = "ready"
    /\ msgs' = msgs \cup {[type |-> "Execute", req |-> 1, worker |-> w], [type |-> "Terminate", worker |-> r]}
    /\ appMasterState' = [w |-> Cardinality(M), t |-> 1, state |-> "inProgress"]
    /\ UNCHANGED <<workerState, terminatorState, workerBuffer>>
    
WorkerRcvExecute(w, r) ==
    /\ workerState[w] = [state |-> "working"]
    /\ [type |-> "Execute", req |-> r, worker |-> w] \in msgs
    /\ workerBuffer' = workerBuffer \cup {r} 
    /\ msgs' = msgs \cup {[type |-> "Execute", req |-> r + 1, worker |-> w]}
    /\ workerState' = IF r = N THEN [workerState EXCEPT ![w] = [state |-> "completed"]] ELSE workerState
    /\ UNCHANGED <<appMasterState, terminatorState>>
    
TerminatorRcvTerminate(w) ==
    /\ terminatorState = "working"
    /\ [type |-> "Terminate", worker |-> w] \in msgs
    /\ msgs' = msgs \cup {[type |-> "Flush", worker |-> w]}
    /\ terminatorState' = "terminating"
    /\ UNCHANGED <<appMasterState, workerState, workerBuffer>>

WorkerRcvFlush(w) ==
    /\ (workerState[w]["state"] = "working") \/ (workerState[w]["state"] = "completed")
    /\ [type |-> "Flush", worker |-> w] \in msgs
    /\ workerBuffer' = {}
    /\ workerState' = [workerState EXCEPT ![w] = [state |-> "flushed"]]
    /\ UNCHANGED <<appMasterState, terminatorState, msgs>>

Next ==
    \/ MasterRegisterWorker
    \/ TerminatorRegister
    \/ MasterRegisterTerminator
    \/ \E r \in M, w \in M:
        MasterRcvRequest(w, r)
    \/ \E r \in (0..N), w \in M:
        WorkerRcvExecute(w, r) \/ WorkerRegister(w) \/ TerminatorRcvTerminate(w) \/ WorkerRcvFlush(w)

Spec == Init /\ [][Next]_<<appMasterState, workerState, terminatorState, workerBuffer, msgs>>

THEOREM Spec => [](TypeOK)
    
    


=============================================================================
