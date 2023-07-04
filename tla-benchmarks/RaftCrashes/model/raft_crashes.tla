--------------------------------- MODULE raft_crashes ---------------------------------

\* A specfication of the raft protocol which models only the active state of the protocols for each timestep

EXTENDS Naturals, FiniteSets, Sequences, TLC

\* The set of server IDs
CONSTANTS Server

\* Server states.
CONSTANTS Follower, Candidate, Leader

----

VARIABLE currentActive

VARIABLE state

vars == <<currentActive, state>>

----

AllStates == {Follower, Candidate, Leader}

----

Init == /\ currentActive = Server
        /\ state = [i \in Server |-> Follower]

Remove(i) == 
    /\ state' = [j \in {x \in currentActive: x # i} |-> state[j]]
    /\ currentActive' = {x \in currentActive: x # i}

UpdateState(i, s) ==
    /\ state' = [state EXCEPT ![i] = s]
    /\ UNCHANGED currentActive

Add(i) ==
    LET newActive == currentActive \union i
    IN 
        /\ currentActive' = newActive
        /\ state' = [j \in newActive |-> IF j \in currentActive THEN state[j] ELSE Follower]

Next == \/ \E i \in Server : Remove(i)
        \/ \E i \in Server, s \in AllStates : UpdateState(i, s)
        \/ \E i \in Server : Add(i)


Spec == Init /\ [][Next]_vars


===================================================================================