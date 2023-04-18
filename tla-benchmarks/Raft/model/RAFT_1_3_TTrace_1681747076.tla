---- MODULE RAFT_1_3_TTrace_1681747076 ----
EXTENDS Sequences, TLCExt, Toolbox, RAFT_1_3, Naturals, TLC

_expression ==
    LET RAFT_1_3_TEExpression == INSTANCE RAFT_1_3_TEExpression
    IN RAFT_1_3_TEExpression!expression
----

_trace ==
    LET RAFT_1_3_TETrace == INSTANCE RAFT_1_3_TETrace
    IN RAFT_1_3_TETrace!trace
----

_inv ==
    ~(
        TLCGet("level") = Len(_TETrace)
        /\
        votedFor = (<<0, 0, 0>>)
        /\
        currentTerm = (<<2, 1, 2>>)
        /\
        votesResponded = (<<{}, {}, {}>>)
        /\
        log = (<<<<>>, <<>>, <<>>>>)
        /\
        votesGranted = (<<{}, {}, {}>>)
        /\
        matchIndex = (<<<<0, 0, 0>>, <<0, 0, 0>>, <<0, 0, 0>>>>)
        /\
        state = (<<"candidate", "follower", "candidate">>)
        /\
        nextIndex = (<<<<1, 1, 1>>, <<1, 1, 1>>, <<1, 1, 1>>>>)
        /\
        commitIndex = (<<0, 0, 0>>)
    )
----

_init ==
    /\ matchIndex = _TETrace[1].matchIndex
    /\ log = _TETrace[1].log
    /\ state = _TETrace[1].state
    /\ commitIndex = _TETrace[1].commitIndex
    /\ currentTerm = _TETrace[1].currentTerm
    /\ votesResponded = _TETrace[1].votesResponded
    /\ nextIndex = _TETrace[1].nextIndex
    /\ votesGranted = _TETrace[1].votesGranted
    /\ votedFor = _TETrace[1].votedFor
----

_next ==
    /\ \E i,j \in DOMAIN _TETrace:
        /\ \/ /\ j = i + 1
              /\ i = TLCGet("level")
        /\ matchIndex  = _TETrace[i].matchIndex
        /\ matchIndex' = _TETrace[j].matchIndex
        /\ log  = _TETrace[i].log
        /\ log' = _TETrace[j].log
        /\ state  = _TETrace[i].state
        /\ state' = _TETrace[j].state
        /\ commitIndex  = _TETrace[i].commitIndex
        /\ commitIndex' = _TETrace[j].commitIndex
        /\ currentTerm  = _TETrace[i].currentTerm
        /\ currentTerm' = _TETrace[j].currentTerm
        /\ votesResponded  = _TETrace[i].votesResponded
        /\ votesResponded' = _TETrace[j].votesResponded
        /\ nextIndex  = _TETrace[i].nextIndex
        /\ nextIndex' = _TETrace[j].nextIndex
        /\ votesGranted  = _TETrace[i].votesGranted
        /\ votesGranted' = _TETrace[j].votesGranted
        /\ votedFor  = _TETrace[i].votedFor
        /\ votedFor' = _TETrace[j].votedFor

\* Uncomment the ASSUME below to write the states of the error trace
\* to the given file in Json format. Note that you can pass any tuple
\* to `JsonSerialize`. For example, a sub-sequence of _TETrace.
    \* ASSUME
    \*     LET J == INSTANCE Json
    \*         IN J!JsonSerialize("RAFT_1_3_TTrace_1681747076.json", _TETrace)

=============================================================================

 Note that you can extract this module `RAFT_1_3_TEExpression`
  to a dedicated file to reuse `expression` (the module in the 
  dedicated `RAFT_1_3_TEExpression.tla` file takes precedence 
  over the module `BlockingQueue_TEExpression` below).

---- MODULE RAFT_1_3_TEExpression ----
EXTENDS Sequences, TLCExt, Toolbox, RAFT_1_3, Naturals, TLC

expression == 
    [
        \* To hide variables of the `RAFT_1_3` spec from the error trace,
        \* remove the variables below.  The trace will be written in the order
        \* of the fields of this record.
        matchIndex |-> matchIndex
        ,log |-> log
        ,state |-> state
        ,commitIndex |-> commitIndex
        ,currentTerm |-> currentTerm
        ,votesResponded |-> votesResponded
        ,nextIndex |-> nextIndex
        ,votesGranted |-> votesGranted
        ,votedFor |-> votedFor
        
        \* Put additional constant-, state-, and action-level expressions here:
        \* ,_stateNumber |-> _TEPosition
        \* ,_matchIndexUnchanged |-> matchIndex = matchIndex'
        
        \* Format the `matchIndex` variable as Json value.
        \* ,_matchIndexJson |->
        \*     LET J == INSTANCE Json
        \*     IN J!ToJson(matchIndex)
        
        \* Lastly, you may build expressions over arbitrary sets of states by
        \* leveraging the _TETrace operator.  For example, this is how to
        \* count the number of times a spec variable changed up to the current
        \* state in the trace.
        \* ,_matchIndexModCount |->
        \*     LET F[s \in DOMAIN _TETrace] ==
        \*         IF s = 1 THEN 0
        \*         ELSE IF _TETrace[s].matchIndex # _TETrace[s-1].matchIndex
        \*             THEN 1 + F[s-1] ELSE F[s-1]
        \*     IN F[_TEPosition - 1]
    ]

=============================================================================



Parsing and semantic processing can take forever if the trace below is long.
 In this case, it is advised to deserialize the trace from a binary file.
 To create the file, replace your spec's invariant F with:
  Inv == IF F THEN TRUE ELSE ~IOSerialize(Trace, "file.bin", TRUE)
 (IOUtils module is from https://modules.tlapl.us/)
\*
\*---- MODULE RAFT_1_3_TETrace ----
\*EXTENDS IOUtils, RAFT_1_3, TLC
\*
\*trace == IODeserialize("file.bin", TRUE)
\*
\*=============================================================================
\*

---- MODULE RAFT_1_3_TETrace ----
EXTENDS RAFT_1_3, TLC

trace == 
    <<
    ([votedFor |-> <<0, 0, 0>>,currentTerm |-> <<1, 1, 1>>,votesResponded |-> <<{}, {}, {}>>,log |-> <<<<>>, <<>>, <<>>>>,votesGranted |-> <<{}, {}, {}>>,matchIndex |-> <<<<0, 0, 0>>, <<0, 0, 0>>, <<0, 0, 0>>>>,state |-> <<"follower", "follower", "follower">>,nextIndex |-> <<<<1, 1, 1>>, <<1, 1, 1>>, <<1, 1, 1>>>>,commitIndex |-> <<0, 0, 0>>]),
    ([votedFor |-> <<0, 0, 0>>,currentTerm |-> <<2, 1, 1>>,votesResponded |-> <<{}, {}, {}>>,log |-> <<<<>>, <<>>, <<>>>>,votesGranted |-> <<{}, {}, {}>>,matchIndex |-> <<<<0, 0, 0>>, <<0, 0, 0>>, <<0, 0, 0>>>>,state |-> <<"candidate", "follower", "follower">>,nextIndex |-> <<<<1, 1, 1>>, <<1, 1, 1>>, <<1, 1, 1>>>>,commitIndex |-> <<0, 0, 0>>]),
    ([votedFor |-> <<0, 0, 0>>,currentTerm |-> <<2, 1, 2>>,votesResponded |-> <<{}, {}, {}>>,log |-> <<<<>>, <<>>, <<>>>>,votesGranted |-> <<{}, {}, {}>>,matchIndex |-> <<<<0, 0, 0>>, <<0, 0, 0>>, <<0, 0, 0>>>>,state |-> <<"candidate", "follower", "candidate">>,nextIndex |-> <<<<1, 1, 1>>, <<1, 1, 1>>, <<1, 1, 1>>>>,commitIndex |-> <<0, 0, 0>>])
    >>
----


=============================================================================

---- CONFIG RAFT_1_3_TTrace_1681747076 ----
CONSTANTS
    Follower <- const_168011158880918000
    Leader <- const_168011158880919000
    LargestTerm <- const_168011158880920000
    Nil <- const_168011158880921000
    MaxLogIndex <- const_168011158880922000
    Candidate <- const_168011158880923000
    Value <- const_168011158880924000
    Server <- const_168011158880925000

INVARIANT
    _inv

CHECK_DEADLOCK
    \* CHECK_DEADLOCK off because of PROPERTY or INVARIANT above.
    FALSE

INIT
    _init

NEXT
    _next

CONSTANT
    _TETrace <- _trace

ALIAS
    _expression
=============================================================================
\* Generated on Mon Apr 17 17:58:30 CEST 2023